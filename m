Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C813B5D49
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 13:44:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1ED383C86B4
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 13:44:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35D853C1CC3
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 13:43:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 83D5F600728
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 13:43:53 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B008821FF2
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624880632;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJ/uK2uYLWw/NuZ0ywfmyVJmjMp8owktevgT9vnu3LU=;
 b=afgo0lfYEqZU9L9wHEEJh6i373oy5hMxYYdF/9uyxg8Ji02itiTl7Vj38rWIr+l17s2lRO
 x6w35UcF8GEE/1DMCyq4NuRWNuEqjzlz+z4A00GateSpTvTON+8UXtOMU3+TDHtP5NoJod
 JZwSDDoPv9lDtiViezngFm1rPlH4SE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624880632;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJ/uK2uYLWw/NuZ0ywfmyVJmjMp8owktevgT9vnu3LU=;
 b=rk4WV6KdlUuW8r8vqnk60KSNoAtFbXvGZVG2sAYAvyhcVKaO9hIt3ytIDq+TcaCO+QvlYR
 9Aro+ALCMFbUCyDQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2A2C8A3B8C;
 Mon, 28 Jun 2021 11:43:52 +0000 (UTC)
References: <20210625160644.11831-1-mdoucha@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <20210625160644.11831-1-mdoucha@suse.cz>
Date: Mon, 28 Jun 2021 12:43:51 +0100
Message-ID: <87zgva2ozs.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add documentation for netdevice and rtnetlink
 libraries
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Martin Doucha <mdoucha@suse.cz> writes:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  doc/network-c-api.txt | 473 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 473 insertions(+)
>  create mode 100644 doc/network-c-api.txt
>
> diff --git a/doc/network-c-api.txt b/doc/network-c-api.txt
> new file mode 100644
> index 000000000..69c87ad97
> --- /dev/null
> +++ b/doc/network-c-api.txt
> @@ -0,0 +1,473 @@
> +LTP C Test Network API
> +======================
> +
> +NOTE: See also
> +      https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines[Test Writing Guidelines],
> +      https://github.com/linux-test-project/ltp/wiki/C-Test-Case-Tutorial[C Test Case Tutorial],
> +      https://github.com/linux-test-project/ltp/wiki/C-Test-API[C Test API],
> +      https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API].
> +
> +LTP library includes helper functions for configuring sockets and setting up
> +network devices.
> +
> +1 Configuring sockets
> +---------------------
> +
> +1.1 Safe syscall variants
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> ++#include "tst_safe_net.h"+
> +
> +Most common standard syscalls and libc functions for configuring sockets have a
> +"safe" variant in LTP library which will terminate the test with appropriate
> +error message if the underlying system function fails (except when called in
> +the test cleanup phase where they'll only print a warning).

This is explained by saying they call +tst_brk+ on failure. Which is
(sort of) documented in C-Test-API. I think it would be better to
document this in one place and link there.

> The safe function
> +names are in uppercase with the +SAFE_+ prefix (e.g. the safe variant of
> ++socket()+ is called +SAFE_SOCKET()+). For most safe functions, the parameters
> +and return type are identical to the standard system function:
> +
> +- +SAFE_SOCKET()+
> +- +SAFE_SOCKETPAIR()+
> +- +SAFE_GETSOCKOPT()+
> +- +SAFE_SETSOCKOPT()+
> +- +SAFE_BIND()+
> +- +SAFE_LISTEN()+
> +- +SAFE_ACCEPT()+
> +- +SAFE_CONNECT()+
> +- +SAFE_GETSOCKNAME()+
> +- +SAFE_GETHOSTNAME()+
> +- +SAFE_GETADDRINFO()+
> +
> +A few safe functions have extra parameters for quick return value validation.
> +The ellipsis (+...+) represents the standard parameters of the underlying system
> +function:
> +
> +* +SAFE_SEND(char strict, ...)+
> +* +SAFE_SENDTO(char strict, ...)+
> +** If +strict+ is non-zero, the return value must be equal to the data length
> +   argument. Otherwise the test will fail and exit.
> +
> +* +SAFE_SENDMSG(size_t msg_len, ...)+
> +* +SAFE_RECV(size_t msg_len, ...)+
> +* +SAFE_RECVMSG(size_t msg_len, ...)+
> +** If +msg_len+ is non-zero, the return value must be equal to the +msg_len+
> +   argument. Otherwise the test will fail and exit.
> +
> +There are also some custom functions for simpler configuration and queries:
> +
> +- +int SAFE_SETSOCKOPT_INT(int sockfd, int level, int optname, int value)+ -
> +  Simple setsockopt() variant for passing integers by value.
> +
> +- +int TST_GETSOCKPORT(int sockfd)+ - Get port number (in host byte order) of a
> +  bound socket.
> +
> +- +unsigned short TST_GET_UNUSED_PORT(int family, int type)+ - Get a random
> +  port number (in network byte order) which is currently closed for the given
> +  socket family and type. Note that another application may open the port while
> +  the test is still running. The test user is responsible for setting up test
> +  environment without such interference.
> +
> +1.2 Address conversion functions
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> ++#include "tst_net.h"+
> +
> +LTP library also provides helper functions for quick initialization of socket
> +address structures:
> +
> +- +void tst_get_in_addr(const char *ip_str, struct in_addr *ip)+ - Convert
> +  human-readable IPv4 address string +ip_str+ to binary representation in
> +  network byte order. The converted value will be stored in the second argument.
> +
> +- +void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6)+ - Convert
> +  human-readable IPv6 address string +ip_str+ to binary representation in
> +  network byte order. The converted value will be stored in the second argument.
> +
> +- +socklen_t tst_get_connect_address(int sock, struct sockaddr_storage *addr)+ -
> +  Find the address which can be used to send data to bound socket +sock+ from
> +  another socket. The address will be stored in the second argument. This
> +  function automatically converts wildcard bind address to localhost. Returns
> +  size of the address in bytes.
> +
> +- +void tst_init_sockaddr_inet(struct sockaddr_in *sa, const char *ip_str,
> +  uint16_t port)+ - Initialize socket address structure +sa+ using
> +  human-readable IPv4 address +ip_str+ and port number +port+ in host byte
> +  order.
> +
> +- +void tst_init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val,
> +  uint16_t port)+ - Initialize socket address structure +sa+ using binary IPv4
> +  address +ip_val+ and port number +port+, both in host byte order.
> +
> +- +void tst_init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str,
> +  uint16_t port)+ - Initialize socket address structure +sa+ using
> +  human-readable IPv6 address +ip_str+ and port number +port+ in host byte
> +  order.
> +
> +- +void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct
> +  in6_addr *ip_val, uint16_t port)+ - Initialize socket address structure +sa+
> +  using binary IPv6 address +ip_val+ and port number +port+, both in host byte
> +  order.
> +
> +.Example Usage
> +[source,c]
> +-------------------------------------------------------------------------------
> +
> +#include <sys/socket.h>
> +#include <netinet/in.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_net.h"
> +#include "tst_net.h"
> +
> +static int sockfd = -1;
> +
> +static void setup(void)
> +{
> +	struct sockaddr_in addr;
> +
> +	tst_init_sockaddr_inet_bin(&addr, INADDR_ANY, 0);
> +	sockfd = SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
> +	SAFE_SETSOCKOPT_INT(sockfd, SOL_SOCKET, SO_SNDBUF, 4096);
> +	SAFE_BIND(sockfd, (struct sockaddr *)&addr, sizeof(addr));
> +	SAFE_LISTEN(sockfd, 8);
> +
> +}
> +
> +-------------------------------------------------------------------------------
> +
> +2 Configuring network devices
> +-----------------------------
> +
> ++#include "tst_netdevice.h"+
> +
> +When opening a localhost socket isn't enough and the test needs special device
> +or routing configuration, the netdevice library can create the required network
> +setup without calling external programs. Internally, the netdevice functions
> +use rtnetlink socket to communicate with the kernel.
      ^a?

I guess they only use one socket normally.

> +
> +All of these functions will terminate the test on failure, unless stated
> +otherwise. Error values described below are returned only during test cleanup
> +stage.

Again tst_brk.

> +
> +2.1 Network device management
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- +int NETDEV_INDEX_BY_NAME(const char *ifname)+ - Returns the device index for
> +  the given device name, or -1 on error.
> +
> +- +int NETDEV_SET_STATE(const char *ifname, int up)+ - Enable or disable a
> +  network device +ifname+. Returns 0 on success, -1 on error.
> +
> +- +int CREATE_VETH_PAIR(const char *ifname1, const char *ifname2)+ - Creates a
> +  connected pair of virtual network devices with given device names. Returns 1
> +  on success, 0 on error. Add +"CONFIG_VETH"+ to +test.needs_kconfigs+ if your
> +  test calls this function.
> +
> +- +int REMOVE_NETDEV(const char *ifname)+ - Removes network device +ifname+.
> +  Returns 1 on success, 0 on error.

Nothing wrong with the docs, but I still think there is risk here with
macro name clashes. Also it's not consistent with the rest of the test
API. So either they should be prepended with TST_ or SAFE_ depending on
how we decide to define those.

> +
> +2.2 Network address management
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- +int NETDEV_ADD_ADDRESS(const char \*ifname, unsigned int family, const void
> +  *address, unsigned int prefix, size_t addrlen, unsigned int flags)+ - Adds
> +  new address to network device +ifname+. This is a low-level function which
> +  allows setting any type of address. You must specify the protocol +family+,
> +  address length in bytes (+addrlen+) and network prefix length (+prefix+). The
> +  +address+ itself must be in binary representation in network byte order. You
> +  can also pass rtnetlink flags from the +IFA_F_*+ group. Returns 1 on success,
> +  0 on error.
> +
> +- +int NETDEV_ADD_ADDRESS_INET(const char *ifname, in_addr_t address, unsigned
> +  int prefix, unsigned int flags)+ - Adds new IPv4 address to network device
> +  +ifname+. Parameters have the same meaning as in +NETDEV_ADD_ADDRESS()+.
> +  Returns 1 on success, 0 on error.
> +
> +- +int NETDEV_REMOVE_ADDRESS(const char *ifname, unsigned int family, const
> +  void *address, size_t addrlen)+ - Removes the specified address from network
> +  device +ifname+. Parameters have the same meaning as in
> +  +NETDEV_ADD_ADDRESS()+. Returns 1 on success, 0 on error.
> +
> +- +int NETDEV_REMOVE_ADDRESS_INET(const char *ifname, in_addr_t address)+ -
> +  Removes specified IPv4 +address+ (in network byte order) from network device
> +  +ifname+. Returns 1 on success, 0 on error.
> +
> +2.3 Network namespace device assignment
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Warning: Moving a network device to another namespace will erase previous
> +configuration. Move the device to the correct namespace first, then configure
> +it.
> +
> +- +int NETDEV_CHANGE_NS_FD(const char *ifname, int nsfd)+ - Moves network
> +  device +ifname+ to network namespace designated by open file descriptor
> +  +nsfd+. Returns 1 on success, 0 on error.
> +
> +- +int NETDEV_CHANGE_NS_PID(const char *ifname, pid_t nspid)+ - Moves network
> +  device +ifname+ to the network namespace currently used by process +nspid+.
> +  Returns 1 on success, 0 on error.
> +
> +2.4 Routing table management
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- +int NETDEV_ADD_ROUTE(const char *ifname, unsigned int family, const void
> +  *srcaddr, unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +  unsigned int dstprefix, size_t dstlen, const void *gateway, size_t
> +  gatewaylen)+ - Adds new route to the main routing table. This is a low-level
> +  function which allows creating routes for any protocol. You must specify the
> +  protocol +family+ and either network device name +ifname+ or +gateway+
> +  address. Both packet source address +srcaddr+ and destination address
> +  +dstaddr+ are optional. You must also specify the corresponding length
> +  and prefix argument for any address which is not +NULL+. All addresses must
> +  be in binary representation in network byte order. Returns 1 on success,
> +  0 on error.
> +
> +- +int NETDEV_ADD_ROUTE_INET(const char *ifname, in_addr_t srcaddr, unsigned
> +  int srcprefix, in_addr_t dstaddr, unsigned int dstprefix, in_addr_t
> +  gateway)+ - Adds new IPv4 route to the main routing table. Parameters have
> +  the same meaning as in +NETDEV_ADD_ROUTE()+. If you do not want to set
> +  explicit +gateway+ address, set it to 0. If the routing rule should ignore
> +  the source or destination address, set the corresponding prefix argument
> +  to 0. Returns 1 on success, 0 on error.
> +
> +- +int NETDEV_REMOVE_ROUTE(const char *ifname, unsigned int family, const void
> +  *srcaddr, unsigned int srcprefix, size_t srclen, const void *dstaddr,
> +  unsigned int dstprefix, size_t dstlen, const void *gateway, size_t
> +  gatewaylen)+ - Removes a route from the main routing table. Parameters have
> +  the same meaning as in +NETDEV_ADD_ROUTE()+. Returns 1 on success, 0 on
> +  error.
> +
> +- +int NETDEV_REMOVE_ROUTE_INET(const char *ifname, in_addr_t srcaddr,
> +  unsigned int srcprefix, in_addr_t dstaddr, unsigned int dstprefix, in_addr_t
> +  gateway)+ - Removes IPv4 route from the main routing table. Parameters have
> +  the same meaning as in +NETDEV_ADD_ROUTE_INET()+. Returns 1 on success,
> +  0 on error.
> +
> +.Example Usage
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include <arpa/inet.h>
> +#include <linux/if_addr.h>
> +#include "tst_test.h"
> +#include "tst_netdevice.h"
> +
> +...
> +
> +static void setup(void)
> +{
> +	CREATE_VETH_PAIR("ltp_veth1", "ltp_veth2");
> +	NETDEV_ADD_ADDRESS_INET("ltp_veth2", htonl(DSTADDR), NETMASK,
> +		IFA_F_NOPREFIXROUTE);
> +	NETDEV_SET_STATE("ltp_veth2", 1);
> +	NETDEV_ADD_ROUTE_INET("ltp_veth2", 0, 0, htonl(SRCNET), NETMASK, 0);
> +
> +	NETDEV_ADD_ADDRESS_INET("ltp_veth1", htonl(SRCADDR), NETMASK,
> +		IFA_F_NOPREFIXROUTE);
> +	NETDEV_SET_STATE("ltp_veth1", 1);
> +	NETDEV_ADD_ROUTE_INET("ltp_veth1", 0, 0, htonl(DSTNET), NETMASK, 0);
> +
> +	...
> +}
> +-------------------------------------------------------------------------------
> +
> +3 rtnetlink API
> +---------------
> +
> ++#include "tst_rtnetlink.h"+
> +
> +The rtnetlink library provides helper functions for constructing and sending
> +arbitrary messages and parsing kernel responses.
> +
> +All of the functions below will terminate the test on failure, unless stated
> +otherwise. Error values described below are returned only during test cleanup
> +stage.
> +
> +3.1 Data structures
> +~~~~~~~~~~~~~~~~~~~
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +struct tst_rtnl_context;
> +
> +struct tst_rtnl_attr_list {
> +	unsigned short type;

I wonder if we could make this into an enum? Or is it interpreted
differently depending on context?

> +	const void *data;
> +	ssize_t len;
> +	const struct tst_rtnl_attr_list *sublist;
> +};
> +
> +struct tst_rtnl_message {
> +	struct nlmsghdr *header;
> +	struct nlmsgerr *err;
> +	void *payload;
> +	size_t payload_size;
> +};
> +-------------------------------------------------------------------------------
> +
> ++struct tst_rtnl_context+ is an opaque rtnetlink socket with buffer for
> +constructing and sending arbitrary messages using the functions described
> +below. Create a new context using +RTNL_CREATE_CONTEXT()+, then free it using
> ++RTNL_DESTROY_CONTEXT()+ when you're done with it.
> +
> ++struct tst_rtnl_attr_list+ is a helper structure for defining complex
> +rtnetlink message attribute payloads, including nested attribute lists. Every
> +list and sublist defined using this structure is terminated by item with
> +negative +len+.
> +
> +- +type+ is the attribute type that will be stored in +struct rtattr.rta_type+.
> +
> +- +data+ contains arbitrary attribute payload.
> +
> +- +len+ contains length of the +data+ attribute in bytes. If +data+ is +NULL+,
> +  set +len+ to 0. The last item in a list or sublist must have negative length.
> +
> +- +sublist+ contains a nested attribute list which will be appended after
> +  +data+ as part of the attribute payload. +struct rtattr.rta_len+ will be
> +  calculated automatically with proper alignment, do _not_ add the sublist size
> +  to the +len+ field. If you do not want to add nested attributes, set
> +  +sublist+ to +NULL+.
> +
> ++struct tst_rtnl_message+ is a structure holding partially parsed rtnetlink
> +messages received from the kernel. +RTNL_RECV()+ returns an array of these
> +structures with the last item having +NULL+ in the +header+ field. Call
> ++RTNL_FREE_MESSAGE()+ to free a message list returned by +RTNL_RECV()+.
> +
> +- +header+ is the netlink header structure of the message. +NULL+ in the header
> +  field terminates a list of messages.
> +
> +- +err+ points to the payload of +NLMSG_ERROR+ messages. It is set to +NULL+
> +  for all other message types.
> +
> +- +payload+ is a pointer to message data.
> +
> +- +payload_size+ is the length of +payload+ data in bytes.
> +
> +3.2 Sending and receiving messages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- +struct tst_rtnl_context *RTNL_CREATE_CONTEXT(void)+ - Creates a new
> +  rtnetlink communication context for use with the functions described below.
> +  Returns +NULL+ on error.
> +
> +- +void RTNL_FREE_MESSAGE(struct tst_rtnl_message *msg)+ - Frees an array of
> +  messages returned by +RTNL_RECV()+.
> +
> +- +void RTNL_DESTROY_CONTEXT(struct tst_rtnl_context *ctx)+ - Closes a
> +  communication context created by +RTNL_CREATE_CONTEXT()+.
> +
> +- +int RTNL_SEND(struct tst_rtnl_context *ctx)+ - Sends all messages waiting
> +  in +ctx+ buffer to the kernel. If there are multiple messages to send, a new
> +  +NLMSG_DONE+ message will be added automatically. Returns the number of
> +  bytes sent on success. Return 0 or negative value on error.
> +
> +- +int RTNL_SEND_VALIDATE(struct tst_rtnl_context *ctx)+ - Sends all messages
> +  just like +RTNL_SEND()+, then receives the response from the kernel and
> +  validates results of requests sent with the +NLM_F_ACK+ flag. This function
> +  terminates the program as usual if communication fails but it will return
> +  error status without terminating if one of the received messages contains
> +  error code. See +RTNL_CHECK_ACKS()+ below for explanation of the return value.
> +
> +- +int RTNL_WAIT(struct tst_rtnl_context *ctx)+ - Waits until data becomes
> +  available to read from the rtnetlink socket (timeout: 1 second). Returns 1
> +  if there is data to read, 0 on timeout or -1 on error.
> +
> +- +struct tst_rtnl_message *RTNL_RECV(struct tst_rtnl_context *ctx)+ - Receives
> +  rtnetlink messages from the kernel. The messages are received in non-blocking
> +  mode so calling +RTNL_WAIT()+ first is recommended. Returns an array of
> +  partially parsed messages terminated by an item with +NULL+ in the +header+
> +  field. On error or when there are no messages to receive, returns +NULL+.
> +  Call +RTNL_FREE_MESSAGE()+ to free the returned data.
> +
> +- +int RTNL_CHECK_ACKS(struct tst_rtnl_context *ctx, struct tst_rtnl_message
> +  *response)+ - Validate results of requests sent with the +NLM_F_ACK+ flag.
> +  Do not call +RTNL_ADD_MESSAGE()+ between +RTNL_SEND()+ and
> +  +RTNL_CHECK_ACKS()+ because it will reset the state of +ctx+ and prevent
> +  result validation. Returns 1 if all messages sent with the +NLM_F_ACK+ flag
> +  have a corresponding message in +response+ and the error code is 0. If any
> +  of the expected response messages is missing, this function will terminate
> +  the test program with error (or return 0 during test cleanup phase).
> +  If any of the response messages has non-zero error code, this function will
> +  return 0 and store the first non-zero error code in global variable
> +  +tst_rtnl_errno+ (sign-flipped just like regular libc +errno+).

Again tst_brk.

> +
> +3.3 Creating messages
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +- +int RTNL_ADD_MESSAGE(struct tst_rtnl_context *ctx, const struct nlmsghdr
> +  *header, const void *payload, size_t payload_size)+ - Adds new rtnetlink
> +  message to +ctx+ buffer. You need to provide message +header+ and optional
> +  +payload+. +payload_size+ is the size of +payload+ data in bytes. If you
> +  don't want to add any payload data, set +payload+ to +NULL+ and
> +  +payload_size+ to 0. This function will automatically fill the +nlmsg_len+,
> +  +nlmsg_seq+ and +nlmsg_pid+ fields of the new message header. You don't need
> +  to set those. It'll also automatically add +NLM_F_MULTI+ flag when needed.
> +  Returns 1 on success, 0 on error. Note that the first call of
> +  +RTNL_ADD_MESSAGE()+ after +RTNL_SEND()+ will reset the state of +ctx+
> +  and +RTNL_CHECK_ACKS()+ will not work correctly until the next +RTNL_SEND()+.
> +
> +- +int RTNL_ADD_ATTR(struct tst_rtnl_context *ctx, unsigned short type, const
> +  void *data, unsigned short len)+ - Adds new attribute to the last message
> +  in +ctx+ buffer. See +RTNL_ADD_MESSAGE()+. You need to provide attribute
> +  +type+ which will be stored in +struct rtattr.rta_type+, optional payload
> +  +data+ and payload size +len+ in bytes. If you don't want to add any payload,
> +  set +data+ to +NULL+ and +len+ to 0. Returns 1 on success, 0 on error.
> +
> +- +int RTNL_ADD_ATTR_STRING(struct tst_rtnl_context *ctx, unsigned short type,
> +  const char *data)+ - Adds new string attribute to the last message in +ctx+
> +  buffer. Parameters and return value are the same as for +RTNL_ADD_ATTR()+,
> +  except the payload length is calculated using +strlen()+.
> +
> +- +int RTNL_ADD_ATTR_LIST(struct tst_rtnl_context *ctx, const struct
> +  tst_rtnl_attr_list *list)+ - Adds a list of attributes to the last message
> +  in +ctx+ buffer. See description of +struct tst_rtnl_attr_list+ and
> +  +RTNL_ADD_MESSAGE()+ above.  Returns the number of added attributes on
> +  success (nested attributes are not counted), -1 on error.
> +
> +.Example Usage
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include <asm/types.h>
> +#include <linux/netlink.h>
> +#include <linux/rtnetlink.h>
> +#include <sys/socket.h>
> +#include <netinet/in.h>
> +#include <arpa/inet.h>
> +
> +#include "tst_test.h"
> +#include "tst_rtnetlink.h"
> +#include "tst_netdevice.h"
> +
> +...
> +
> +void setup(void)
> +{
> +	struct tst_rtnl_context *ctx;
> +	int index, ret;
> +	in_addr_t addr;
> +
> +	struct nlmsghdr header = {
> +		.nlmsg_type = RTM_NEWADDR,
> +		.nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
> +			NLM_F_EXCL
> +	};
> +
> +	struct ifaddrmsg info = {
> +		.ifa_family = AF_INET,
> +		.ifa_prefixlen = 24
> +	};
> +
> +	index = NETDEV_INDEX_BY_NAME("ltp_veth1");
> +	info.ifa_index = index;
> +
> +	ctx = RTNL_CREATE_CONTEXT();
> +	RTNL_ADD_MESSAGE(ctx, &header, &info, sizeof(info));
> +	addr = inet_addr("192.168.123.45");
> +	RTNL_ADD_ATTR(ctx, IFA_LOCAL, &addr, sizeof(addr));
> +	ret = RTNL_SEND_VALIDATE(ctx);
> +	RTNL_DESTROY_CONTEXT(ctx);
> +
> +	if (!ret) {
> +		tst_brk(TBROK, "Failed to set ltp_veth1 address");
> +	}
> +}
> +-------------------------------------------------------------------------------
> -- 
> 2.32.0

Generally looks very good. Although this is a very large chunk of text
to review and some of the functions are still unused. Would have been
better to only submit parts of the API needed for the present test.

You can also use an RFC to present WIP and maybe prevent duplicate
effort.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
