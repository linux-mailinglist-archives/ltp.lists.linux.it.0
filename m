Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E513418C972
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 10:03:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 904533C5390
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 10:03:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 90B8B3C5381
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 10:03:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 99C2A600C5A
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 10:03:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11CB7AE5C
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 09:03:44 +0000 (UTC)
Date: Fri, 20 Mar 2020 10:03:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200320090342.GA12179@dell5510>
References: <20200317121057.13529-1-mdoucha@suse.cz>
 <20200317121057.13529-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317121057.13529-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] Add socket address initialization
 functions to tst_net library
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> @@ -145,3 +146,73 @@ void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6)
>  	if (inet_pton(AF_INET6, ip_str, ip6) <= 0)
>  		tst_brk_comment("bad IPv6 address: '%s'", ip_str);
Just a note: tst_brk_comment() and tst_res_comment() prepend '# ' to the
message. This was meant only for tst_net_vars.c, tst_net_ip_prefix.c and
tst_net_iface_prefix.c, to prevent shell eval breakage. But let's use it also
for tests as the code gets simpler.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
