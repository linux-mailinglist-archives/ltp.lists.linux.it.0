Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877A34E325
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:30:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFC6C3C7810
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:30:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD6403C2476
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:30:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2E92510004A4
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:30:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1FB1B1BD;
 Tue, 30 Mar 2021 08:30:17 +0000 (UTC)
Date: Tue, 30 Mar 2021 10:30:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YGLhmNUg/JMrWjqt@pevik>
References: <20210315092844.991073-1-lkml@jv-coder.de>
 <20210315092844.991073-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315092844.991073-2-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pec: Fix multiple event test
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

I was not able to run this test without failures (using your original test, just
adding missing SAFE_EXECV(), see logs below.

Can you please review my fixes to first commit [1]
and after I merge it send v2 of this patch?

Thanks for working on this!

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2021-March/021771.html

cn_pec 1 TINFO: timeout per run is 0h 5m 0s
cn_pec 1 TINFO: Test process events connector
cn_pec 1 TINFO: Testing fork event (nevents=10)
cn_pec 1 TPASS: All events detected
cn_pec 2 TINFO: Testing exec event (nevents=10)
cn_pec 2 TPASS: All events detected
cn_pec 3 TINFO: Testing exit event (nevents=10)
cn_pec 3 TFAIL: Event was not detected by the event listener: exit pid: 20816 exit_code: 0
none err: 0
exit pid: 20813 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20814
exit pid: 20814 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20815
exec pid: 20815
fork parent: 20815, child: 20816
exit pid: 20816 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20817
exit pid: 20817 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20818
exit pid: 20818 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20819
exit pid: 20819 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20820
exit pid: 20820 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20821
exit pid: 20821 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20822
exit pid: 20822 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20823
exit pid: 20823 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20824
exit pid: 20824 exit_code: 0 exit_signal: 17
fork parent: 20815, child: 20825
exit pid: 20825 exit_code: 0 exit_signal: 17
exit pid: 20815 exit_code: 0 exit_signal: 17
cn_pec 4 TINFO: Testing uid event (nevents=10)
cn_pec 4 TFAIL: Event was not detected by the event listener: uid pid: 20844 euid: 65534
none err: 0
exit pid: 17409 exit_code: 0 exit_signal: 17
exit pid: 20842 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20843
exit pid: 20843 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20844
exec pid: 20844
uid pid: 20844 euid: 65534 ruid: 65534
exit pid: 20844 exit_code: 0 exit_signal: 17
cn_pec 5 TINFO: Testing gid event (nevents=10)
cn_pec 5 TFAIL: Event was not detected by the event listener: gid pid: 20863 egid: 65533
none err: 0
exit pid: 20861 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20862
exit pid: 20862 exit_code: 0 exit_signal: 17
fork parent: 20737, child: 20863
exec pid: 20863
gid pid: 20863 egid: 65533 rgid: 65533
exit pid: 20863 exit_code: 0 exit_signal: 17
cn_pec 6 TINFO: AppArmor enabled, this may affect test results
cn_pec 6 TINFO: it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root)
cn_pec 6 TINFO: loaded AppArmor profiles: none

Summary:
passed   2
failed   3
skipped  0
warnings 0


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
