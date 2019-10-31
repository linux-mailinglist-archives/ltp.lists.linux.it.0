Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5EEAC47
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:06:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D963A3C22AB
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:06:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A3D053C0737
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:06:06 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DA8181000DB2
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:06:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22AABAF7A;
 Thu, 31 Oct 2019 09:06:05 +0000 (UTC)
Date: Thu, 31 Oct 2019 10:06:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191031090603.GA15784@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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

Hi Jan,

> > Hm, did you reproduce it on 4.18 (rhel8)?

> Above was RHEL7. Do you expect different outcome on RHEL8?
> I was looking at upstream sources too and it looked similar.
I know it was RHEL7. Good it's not affected by old kernel code,
but rather by overloaded host. Agree, that some tolerance is needed.

> Anyway, I don't think this part is an issue, test will skip it
> because "comm" doesn't match.

> We can tweak 'ac_btime' condition, but I think the test will remain
> race-y in environments with higher steal time:

> acct02.c:239: INFO: Verifying using 'struct acct_v3'
> acct02.c:192: INFO: == entry 1 ==
> acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> acct02.c:192: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 43213 (43212)
> acct02.c:182: FAIL: end of file reached

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
