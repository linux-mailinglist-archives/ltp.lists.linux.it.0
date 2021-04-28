Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D336D5EF
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 12:48:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74C803C629A
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 12:48:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D2EA93C0F91
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 12:48:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 988D01000A5A
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 12:48:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F51CAFC4
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:48:05 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:27:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YIk4qL+lBIKt+4tX@yuki>
References: <20210426111918.4304-1-mdoucha@suse.cz>
 <20210426111918.4304-5-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426111918.4304-5-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] RFC: Add helper functions for managing
 network interfaces
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The library currently supports:
> - creating a virtual ethernet device pair
> - removing network interfaces
> - enabling or disabling a network interface
> - managing interface addresses
> - managing routing table entries
> - moving network interfaces between network namespaces
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_netdevice.h | 120 ++++++++++
>  lib/tst_netdevice.c     | 506 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 626 insertions(+)
>  create mode 100644 include/tst_netdevice.h
>  create mode 100644 lib/tst_netdevice.c
> 
> diff --git a/include/tst_netdevice.h b/include/tst_netdevice.h
> new file mode 100644
> index 000000000..69f559fdd
> --- /dev/null
> +++ b/include/tst_netdevice.h
> @@ -0,0 +1,120 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (c) 2021 Linux Test Project
> + */
> +
> +#ifndef TST_NETDEVICE_H
> +#define TST_NETDEVICE_H
> +
> +/* Find device index for given network interface name. */
> +int tst_netdevice_index(const char *file, const int lineno, const char *ifname);
> +#define NETDEVICE_INDEX(ifname) \
> +	tst_netdevice_index(__FILE__, __LINE__, (ifname))
> +
> +/* Activate or deactivate network interface */
> +int tst_netdevice_activate(const char *file, const int lineno,
> +	const char *ifname, int up);
> +#define NETDEVICE_ACTIVATE(ifname, up) \
> +	tst_netdevice_activate(__FILE__, __LINE__, (ifname), (up))
> +
> +/* Create a connected pair of virtual network devices */
> +int tst_create_veth_pair(const char *file, const int lineno,
> +	const char *ifname1, const char *ifname2);
> +#define CREATE_VETH_PAIR(ifname1, ifname2) \
> +	tst_create_veth_pair(__FILE__, __LINE__, (ifname1), (ifname2))
> +
> +int tst_remove_netdevice(const char *file, const int lineno,
> +	const char *ifname);
> +#define REMOVE_NETDEVICE(ifname) \
> +	tst_remove_netdevice(__FILE__, __LINE__, (ifname))
> +
> +int tst_netdevice_add_address(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *address,
> +	unsigned int prefix, size_t addrlen, unsigned int flags);
> +#define NETDEVICE_ADD_ADDRESS(ifname, family, address, prefix, addrlen, flags) \
> +	tst_netdevice_add_address(__FILE__, __LINE__, (ifname), (family), \
> +		(address), (prefix), (addrlen), (flags))
> +
> +int tst_netdevice_add_address_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t address, unsigned int prefix,
> +	unsigned int flags);
> +#define NETDEVICE_ADD_ADDRESS_INET(ifname, address, prefix, flags) \
> +	tst_netdevice_add_address_inet(__FILE__, __LINE__, (ifname), \
> +		(address), (prefix), (flags))
> +
> +int tst_netdevice_remove_address(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *address,
> +	size_t addrlen);
> +#define NETDEVICE_REMOVE_ADDRESS(ifname, family, address, addrlen) \
> +	tst_netdevice_remove_address(__FILE__, __LINE__, (ifname), (family), \
> +		(address), (addrlen))
> +
> +int tst_netdevice_remove_address_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t address);
> +#define NETDEVICE_REMOVE_ADDRESS_INET(ifname, address) \
> +	tst_netdevice_remove_address_inet(__FILE__, __LINE__, (ifname), \
> +		(address))
> +
> +int tst_netdevice_change_ns_fd(const char *file, const int lineno,
> +	const char *ifname, int nsfd);
> +#define NETDEVICE_CHANGE_NS_FD(ifname, nsfd) \
> +	tst_netdevice_change_ns_fd(__FILE__, __LINE__, (ifname), (nsfd))
> +
> +int tst_netdevice_change_ns_pid(const char *file, const int lineno,
> +	const char *ifname, pid_t nspid);
> +#define NETDEVICE_CHANGE_NS_PID(ifname, nspid) \
> +	tst_netdevice_change_ns_pid(__FILE__, __LINE__, (ifname), (nspid))
> +
> +/*
> + * Add new static entry to main routing table. If you specify gateway address,
> + * the interface name is optional.
> + */
> +int tst_netdevice_add_route(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *srcaddr,
> +	unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +	unsigned int dstprefix, size_t dstlen, const void *gateway,
> +	size_t gatewaylen);
> +#define NETDEVICE_ADD_ROUTE(ifname, family, srcaddr, srcprefix, srclen, \
> +	dstaddr, dstprefix, dstlen, gateway, gatewaylen) \
> +	tst_netdevice_add_route(__FILE__, __LINE__, (ifname), (family), \
> +		(srcaddr), (srcprefix), (srclen), (dstaddr), (dstprefix), \
> +		(dstlen), (gateway), (gatewaylen))
> +
> +/*
> + * Simplified function for adding IPv4 static route. If you set srcprefix
> + * or dstprefix to 0, the corresponding address will be ignored. Interface
> + * name is optional if gateway address is non-zero.
> + */
> +int tst_netdevice_add_route_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t srcaddr, unsigned int srcprefix,
> +	in_addr_t dstaddr, unsigned int dstprefix, in_addr_t gateway);
> +#define NETDEVICE_ADD_ROUTE_INET(ifname, srcaddr, srcprefix, dstaddr, \
> +	dstprefix, gateway) \
> +	tst_netdevice_add_route_inet(__FILE__, __LINE__, (ifname), (srcaddr), \
> +		(srcprefix), (dstaddr), (dstprefix), (gateway))
> +
> +/*
> + * Remove static entry from main routing table.
> + */
> +int tst_netdevice_remove_route(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *srcaddr,
> +	unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +	unsigned int dstprefix, size_t dstlen, const void *gateway,
> +	size_t gatewaylen);
> +#define NETDEVICE_REMOVE_ROUTE(ifname, family, srcaddr, srcprefix, srclen, \
> +	dstaddr, dstprefix, dstlen, gateway, gatewaylen) \
> +	tst_netdevice_remove_route(__FILE__, __LINE__, (ifname), (family), \
> +		(srcaddr), (srcprefix), (srclen), (dstaddr), (dstprefix), \
> +		(dstlen), (gateway), (gatewaylen))
> +
> +/*
> + * Simplified function for removing IPv4 static route.
> + */
> +int tst_netdevice_remove_route_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t srcaddr, unsigned int srcprefix,
> +	in_addr_t dstaddr, unsigned int dstprefix, in_addr_t gateway);
> +#define NETDEVICE_REMOVE_ROUTE_INET(ifname, srcaddr, srcprefix, dstaddr, \
> +	dstprefix, gateway) \
> +	tst_netdevice_remove_route_inet(__FILE__, __LINE__, (ifname), \
> +		(srcaddr), (srcprefix), (dstaddr), (dstprefix), (gateway))
> +
> +#endif /* TST_NETDEVICE_H */
> diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
> new file mode 100644
> index 000000000..541541b11
> --- /dev/null
> +++ b/lib/tst_netdevice.c
> @@ -0,0 +1,506 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Linux Test Project
> + */
> +
> +#include <asm/types.h>
> +#include <linux/netlink.h>
> +#include <linux/rtnetlink.h>
> +#include <linux/veth.h>
> +#include <sys/socket.h>
> +#include <net/if.h>
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_rtnetlink.h"
> +#include "tst_netdevice.h"
> +
> +static struct tst_rtnl_context *create_request(const char *file,
> +	const int lineno, unsigned int type, unsigned int flags,
> +	const void *payload, size_t psize)
> +{
> +	struct nlmsghdr header = {0};
> +	struct tst_rtnl_context *ctx;
> +
> +	ctx = tst_rtnl_create_context(file, lineno);
> +
> +	if (!ctx)
> +		return NULL;
> +
> +	header.nlmsg_type = type;
> +	header.nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK | flags;
> +
> +	if (!tst_rtnl_add_message(file, lineno, ctx, &header, payload, psize)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return NULL;
> +	}
> +
> +	return ctx;
> +}
> +
> +int tst_netdevice_index(const char *file, const int lineno, const char *ifname)

The function name could be a bit more descriptive, what about
tst_netdev_idx_by_name() ?

> +{
> +	struct ifreq ifr;
> +	int sock;
> +
> +	if (strlen(ifname) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname);
                                              ^
					      I usually use single
					      quotes inside C strings
					      but that is matter of
					      taste
> +		return -1;
> +	}
> +
> +	sock = safe_socket(file, lineno, NULL, AF_INET, SOCK_DGRAM, 0);
> +
> +	if (sock < 0)
> +		return -1;
> +
> +	strcpy(ifr.ifr_name, ifname);
> +	TEST(ioctl(sock, SIOCGIFINDEX, &ifr));
> +
> +	safe_close(file, lineno, NULL, sock);
> +
> +	if (TST_RET < 0) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"ioctl(SIOCGIFINDEX) failed");
> +	} else if (TST_RET) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Invalid ioctl(SIOCGIFINDEX) return value %ld",
> +			TST_RET);
> +	}

Using SAFE_IOCTL() would save us some lines here, but we would have to
add a few more variants to the safe macros header.

> +	return TST_RET ? -1 : ifr.ifr_ifindex;
> +}
> +
> +int tst_netdevice_activate(const char *file, const int lineno,
> +	const char *ifname, int up)

Naming this function activate is a bit confusing since it sets the
interface up or down depending on the up flag. What about
tst_netdev_state_set() ?

> +{
> +	struct ifreq ifr;
> +	int sock;
> +
> +	if (strlen(ifname) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname);
> +		return -1;
> +	}
> +
> +	sock = safe_socket(file, lineno, NULL, AF_INET, SOCK_DGRAM, 0);
> +
> +	if (sock < 0)
> +		return -1;
> +
> +	strcpy(ifr.ifr_name, ifname);
> +	TEST(ioctl(sock, SIOCGIFFLAGS, &ifr));
> +
> +	if (TST_RET < 0) {
> +		safe_close(file, lineno, NULL, sock);
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"ioctl(SIOCGIFFLAGS) failed");
> +		return TST_RET;
> +	}
> +
> +	if (TST_RET) {
> +		safe_close(file, lineno, NULL, sock);
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Invalid ioctl(SIOCGIFFLAGS) return value %ld",
> +			TST_RET);
> +		return TST_RET;
> +	}
> +
> +	if (up)
> +		ifr.ifr_flags |= IFF_UP;
> +	else
> +		ifr.ifr_flags &= ~IFF_UP;
> +
> +	TEST(ioctl(sock, SIOCSIFFLAGS, &ifr));
> +	safe_close(file, lineno, NULL, sock);
> +
> +	if (TST_RET < 0) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"ioctl(SIOCSIFFLAGS) failed");
> +	} else if (TST_RET) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Invalid ioctl(SIOCSIFFLAGS) return value %ld",
> +			TST_RET);
> +	}
> +
> +	return TST_RET;
> +}
> +
> +int tst_create_veth_pair(const char *file, const int lineno,
> +	const char *ifname1, const char *ifname2)
> +{
> +	int ret;
> +	struct ifinfomsg info = {0};
> +	struct tst_rtnl_context *ctx;
> +	struct tst_rtnl_attr_list peerinfo[] = {
> +		{IFLA_IFNAME, ifname2, strlen(ifname2) + 1, NULL},
> +		{0, NULL, -1, NULL}
> +	};
> +	struct tst_rtnl_attr_list peerdata[] = {
> +		{VETH_INFO_PEER, &info, sizeof(info), peerinfo},
> +		{0, NULL, -1, NULL}
> +	};
> +	struct tst_rtnl_attr_list attrs[] = {
> +		{IFLA_IFNAME, ifname1, strlen(ifname1) + 1, NULL},
> +		{IFLA_LINKINFO, NULL, 0, (const struct tst_rtnl_attr_list[]){
> +			{IFLA_INFO_KIND, "veth", 4, NULL},
> +			{IFLA_INFO_DATA, NULL, 0, peerdata},
> +			{0, NULL, -1, NULL}
> +		}},
> +		{0, NULL, -1, NULL}
> +	};
> +
> +	if (strlen(ifname1) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname1);
> +		return 0;
> +	}
> +
> +	if (strlen(ifname2) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname2);
> +		return 0;
> +	}
> +
> +	info.ifi_family = AF_UNSPEC;

We can just initialize this inline like the rest, rigth?

> +	ctx = create_request(file, lineno, RTM_NEWLINK,
> +		NLM_F_CREATE | NLM_F_EXCL, &info, sizeof(info));
> +
> +	if (!ctx)
> +		return 0;
> +
> +	if (tst_rtnl_add_attr_list(file, lineno, ctx, attrs) != 2) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	ret = tst_rtnl_send_validate(file, lineno, ctx);
> +	tst_rtnl_free_context(file, lineno, ctx);
> +
> +	if (!ret) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Failed to create veth interfaces %s+%s", ifname1,
> +			ifname2);
> +	}
> +
> +	return ret;
> +}
> +
> +int tst_remove_netdevice(const char *file, const int lineno, const char *ifname)
> +{
> +	struct ifinfomsg info = {0};
> +	struct tst_rtnl_context *ctx;
> +	int ret;
> +
> +	if (strlen(ifname) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname);
> +		return 0;
> +	}
> +
> +	info.ifi_family = AF_UNSPEC;

Here as well, inline initialization?

> +	ctx = create_request(file, lineno, RTM_DELLINK, 0, &info, sizeof(info));
> +
> +	if (!ctx)
> +		return 0;
> +
> +	if (!tst_rtnl_add_attr_string(file, lineno, ctx, IFLA_IFNAME, ifname)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	ret = tst_rtnl_send_validate(file, lineno, ctx);
> +	tst_rtnl_free_context(file, lineno, ctx);
> +
> +	if (!ret) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Failed to remove netdevice %s", ifname);
> +	}
> +
> +	return ret;
> +}
> +
> +static int modify_address(const char *file, const int lineno,
> +	unsigned int action, unsigned int nl_flags, const char *ifname,
> +	unsigned int family, const void *address, unsigned int prefix,
> +	size_t addrlen, uint32_t addr_flags)
> +{
> +	struct ifaddrmsg info = {0};
> +	struct tst_rtnl_context *ctx;
> +	int index, ret;
> +
> +	index = tst_netdevice_index(file, lineno, ifname);
> +
> +	if (index < 0) {
> +		tst_brk_(file, lineno, TBROK, "Interface %s not found", ifname);
> +		return 0;
> +	}
> +
> +	info.ifa_family = family;
> +	info.ifa_prefixlen = prefix;
> +	info.ifa_index = index;

Here as well, inline initialization?

We can define the structure here and even include the index in the
initialization as well...

> +	ctx = create_request(file, lineno, action, nl_flags, &info,
> +		sizeof(info));
> +
> +	if (!ctx)
> +		return 0;
> +
> +
> +	if (!tst_rtnl_add_attr(file, lineno, ctx, IFA_FLAGS, &addr_flags,
> +		sizeof(uint32_t))) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	if (!tst_rtnl_add_attr(file, lineno, ctx, IFA_LOCAL, address,
> +		addrlen)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	ret = tst_rtnl_send_validate(file, lineno, ctx);
> +	tst_rtnl_free_context(file, lineno, ctx);
> +
> +	if (!ret) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Failed to modify %s network address", ifname);
> +	}
> +
> +	return ret;
> +}
> +
> +int tst_netdevice_add_address(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *address,
> +	unsigned int prefix, size_t addrlen, unsigned int flags)
> +{
> +	return modify_address(file, lineno, RTM_NEWADDR,
> +		NLM_F_CREATE | NLM_F_EXCL, ifname, family, address, prefix,
> +		addrlen, flags);
> +}
> +
> +int tst_netdevice_add_address_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t address, unsigned int prefix,
> +	unsigned int flags)
> +{
> +	return tst_netdevice_add_address(file, lineno, ifname, AF_INET,
> +		&address, prefix, sizeof(address), flags);
> +}
> +
> +int tst_netdevice_remove_address(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *address,
> +	size_t addrlen)
> +{
> +	return modify_address(file, lineno, RTM_DELADDR, 0, ifname, family,
> +		address, 0, addrlen, 0);
> +}
> +
> +int tst_netdevice_remove_address_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t address)
> +{
> +	return tst_netdevice_remove_address(file, lineno, ifname, AF_INET,
> +		&address, sizeof(address));
> +}

I would consider adding the _inet one-liners as a static inline functions to
the header instead.

> +static int change_ns(const char *file, const int lineno, const char *ifname,
> +	unsigned short attr, uint32_t value)
> +{
> +	struct ifinfomsg info = {0};
> +	struct tst_rtnl_context *ctx;
> +	int ret;
> +
> +	if (strlen(ifname) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname);
> +		return 0;
> +	}
> +
> +	info.ifi_family = AF_UNSPEC;
> +	ctx = create_request(file, lineno, RTM_NEWLINK, 0, &info, sizeof(info));
> +
> +	if (!tst_rtnl_add_attr_string(file, lineno, ctx, IFLA_IFNAME, ifname)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	if (!tst_rtnl_add_attr(file, lineno, ctx, attr, &value,
> +		sizeof(uint32_t))) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	ret = tst_rtnl_send_validate(file, lineno, ctx);
> +	tst_rtnl_free_context(file, lineno, ctx);
> +
> +	if (!ret) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Failed to move %s to another namespace", ifname);
> +	}
> +
> +	return ret;
> +}
> +
> +int tst_netdevice_change_ns_fd(const char *file, const int lineno,
> +	const char *ifname, int nsfd)
> +{
> +	return change_ns(file, lineno, ifname, IFLA_NET_NS_FD, nsfd);
> +}
> +
> +int tst_netdevice_change_ns_pid(const char *file, const int lineno,
> +	const char *ifname, pid_t nspid)
> +{
> +	return change_ns(file, lineno, ifname, IFLA_NET_NS_PID, nspid);
> +}
> +
> +static int modify_route(const char *file, const int lineno, unsigned int action,
> +	unsigned int flags, const char *ifname, unsigned int family,
> +	const void *srcaddr, unsigned int srcprefix, size_t srclen,
> +	const void *dstaddr, unsigned int dstprefix, size_t dstlen,
> +	const void *gateway, size_t gatewaylen)
> +{
> +	struct rtmsg info = {0};
> +	struct tst_rtnl_context *ctx;
> +	int ret;
> +	int32_t index;
> +
> +	if (!ifname && !gateway) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Interface name or gateway address required");
> +		return 0;
> +	}
> +
> +	if (ifname && strlen(ifname) >= IFNAMSIZ) {
> +		tst_brk_(file, lineno, TBROK,
> +			"Network device name \"%s\" too long", ifname);
> +		return 0;
> +	}
> +
> +	if (ifname) {
> +		index = tst_netdevice_index(file, lineno, ifname);
> +
> +		if (index < 0)
> +			return 0;
> +	}
> +
> +	info.rtm_family = family;
> +	info.rtm_dst_len = dstprefix;
> +	info.rtm_src_len = srcprefix;
> +	info.rtm_table = RT_TABLE_MAIN;
> +	info.rtm_protocol = RTPROT_STATIC;
> +	info.rtm_type = RTN_UNICAST;

Inline initialization as well?

> +	if (action == RTM_DELROUTE) {
> +		tst_res_(file, lineno, TINFO, "DELROUTE");
> +		info.rtm_scope = RT_SCOPE_NOWHERE;
> +	} else {
> +		tst_res_(file, lineno, TINFO, "ADDROUTE");
> +		info.rtm_scope = RT_SCOPE_UNIVERSE;
> +	}
> +
> +	ctx = create_request(file, lineno, action, flags, &info, sizeof(info));
> +
> +	if (srcaddr && !tst_rtnl_add_attr(file, lineno, ctx, RTA_SRC, srcaddr,
> +		srclen)) {

Maybe it would be a bit more readable if we put the whole
tst_rtnl_add_attr() on a separate line as:

	if (srcaddr &&
	    !tst_rtnl_add_attr(file, lineno, ctx, RTA_SRC, srcaddr, srclen)) {


	}

> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	if (dstaddr && !tst_rtnl_add_attr(file, lineno, ctx, RTA_DST, dstaddr,
> +		dstlen)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	if (gateway && !tst_rtnl_add_attr(file, lineno, ctx, RTA_GATEWAY,
> +		gateway, gatewaylen)) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	if (ifname && !tst_rtnl_add_attr(file, lineno, ctx, RTA_OIF, &index,
> +		sizeof(index))) {
> +		tst_rtnl_free_context(file, lineno, ctx);
> +		return 0;
> +	}
> +
> +	ret = tst_rtnl_send_validate(file, lineno, ctx);
> +	tst_rtnl_free_context(file, lineno, ctx);
> +
> +	if (!ret) {
> +		tst_brk_(file, lineno, TBROK | TTERRNO,
> +			"Failed to modify network route");
> +	}
> +
> +	return ret;
> +}
> +
> +int tst_netdevice_add_route(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *srcaddr,
> +	unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +	unsigned int dstprefix, size_t dstlen, const void *gateway,
> +	size_t gatewaylen)
> +{
> +	return modify_route(file, lineno, RTM_NEWROUTE,
> +		NLM_F_CREATE | NLM_F_EXCL, ifname, family, srcaddr, srcprefix,
> +		srclen, dstaddr, dstprefix, dstlen, gateway, gatewaylen);
> +}
> +
> +int tst_netdevice_add_route_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t srcaddr, unsigned int srcprefix,
> +	in_addr_t dstaddr, unsigned int dstprefix, in_addr_t gateway)
> +{
> +	void *src = NULL, *dst = NULL, *gw = NULL;
> +	size_t srclen = 0, dstlen = 0, gwlen = 0;
> +
> +	if (srcprefix) {
> +		src = &srcaddr;
> +		srclen = sizeof(srcaddr);
> +	}
> +
> +	if (dstprefix) {
> +		dst = &dstaddr;
> +		dstlen = sizeof(dstaddr);
> +	}
> +
> +	if (gateway) {
> +		gw = &gateway;
> +		gwlen = sizeof(gateway);
> +	}
> +
> +	return tst_netdevice_add_route(file, lineno, ifname, AF_INET, src,
> +		srcprefix, srclen, dst, dstprefix, dstlen, gw, gwlen);
> +}
> +
> +int tst_netdevice_remove_route(const char *file, const int lineno,
> +	const char *ifname, unsigned int family, const void *srcaddr,
> +	unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +	unsigned int dstprefix, size_t dstlen, const void *gateway,
> +	size_t gatewaylen)
> +{
> +	return modify_route(file, lineno, RTM_DELROUTE, 0, ifname, family,
> +		srcaddr, srcprefix, srclen, dstaddr, dstprefix, dstlen,
> +		gateway, gatewaylen);
> +}
> +
> +int tst_netdevice_remove_route_inet(const char *file, const int lineno,
> +	const char *ifname, in_addr_t srcaddr, unsigned int srcprefix,
> +	in_addr_t dstaddr, unsigned int dstprefix, in_addr_t gateway)
> +{
> +	void *src = NULL, *dst = NULL, *gw = NULL;
> +	size_t srclen = 0, dstlen = 0, gwlen = 0;
> +
> +	if (srcprefix) {
> +		src = &srcaddr;
> +		srclen = sizeof(srcaddr);
> +	}
> +
> +	if (dstprefix) {
> +		dst = &dstaddr;
> +		dstlen = sizeof(dstaddr);
> +	}
> +
> +	if (gateway) {
> +		gw = &gateway;
> +		gwlen = sizeof(gateway);
> +	}
> +
> +	return tst_netdevice_remove_route(file, lineno, ifname, AF_INET, src,
> +		srcprefix, srclen, dst, dstprefix, dstlen, gw, gwlen);
> +}

This is nearly the same as add_route, maybe it would be easier if we had
modify_route_inet() that would fill in the parameters...


Overall the code looks good to me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
