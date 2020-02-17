Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D31616D6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 16:58:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D84B73C25C9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 16:58:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 193933C13DF
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 16:58:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6A06214017DB
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 16:58:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1AE56B26E;
 Mon, 17 Feb 2020 15:58:44 +0000 (UTC)
Date: Mon, 17 Feb 2020 16:58:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Pankaj  Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <20200217155840.GA4424@dell5510>
References: <MAXPR0101MB146826599C0BAB5162CFDD3FEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MAXPR0101MB146826599C0BAB5162CFDD3FEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Networking test failing
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> i am running ltp test when i checked log files i found following errors in networking tests. I am not getting how to run these test individually????

export PATH="/opt/ltp/testcases/bin:$PATH"
netns_breakns.sh ns_exec ipv4 netlink
on properly installed LTP, to default path /opt/ltp
(that's from runtest/containers).

> netns_netlink    1  TBROK  :  netns_netlink.c:143: system() failed
> netns_netlink    2  TBROK  :  netns_netlink.c:143: Remaining cases broken

> netns_breakns_ns_exec_ipv4_netlink 1 TBROK: unable to create veth pair devices
> Cannot find device "veth0"

It fails on  ip link add veth0 type veth peer name veth1.
Do you have CONFIG_VETH=m or CONFIG_VETH=y in your kernel config (in /boot/config-$(uname -r)).


> I am attaching log file report

> netns_netlink                                                       FAIL       2
> netns_breakns_ns_exec_ipv4_netlink                 FAIL       2
> netns_breakns_ns_exec_ipv6_netlink                 FAIL       2
> netns_breakns_ns_exec_ipv4_ioctl                   FAIL       2
> netns_breakns_ns_exec_ipv6_ioctl                   FAIL       2
> netns_breakns_ip_ipv4_netlink                          FAIL       2
> netns_breakns_ip_ipv6_netlink                          FAIL       2
> netns_breakns_ip_ipv4_ioctl                              FAIL       2
> netns_breakns_ip_ipv6_ioctl                               FAIL       2
> netns_comm_ns_exec_ipv4_netlink                    FAIL       2
> netns_comm_ns_exec_ipv6_netlink                    FAIL       2
> netns_comm_ns_exec_ipv4_ioctl                         FAIL       2
> netns_comm_ns_exec_ipv6_ioctl                         FAIL       2
> netns_comm_ip_ipv4_netlink                              FAIL       2
> netns_comm_ip_ipv6_netlink                               FAIL       2
> netns_comm_ip_ipv4_ioctl                           FAIL       2
> netns_comm_ip_ipv6_ioctl                           FAIL       2
> netns_sysfs                                        FAIL       2

Well, next time a bit more info about the kernel and distro you run might help :).

> How i can resolve these errors please guide me how these tests needs to run and from which path.

> Thank you

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
