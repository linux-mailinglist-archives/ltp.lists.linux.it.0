Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36B398E4B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38D003C556F
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 12CEA3C2920
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A1BFB1400445
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53A592199D;
 Wed,  2 Jun 2021 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=V9HKilNBhJjDcr0SKyD5CwulF+/uQg+XoOlMis2RAAM=;
 b=k5itBG9buJDgkYY2zBmPKNzpY5E2DFi9yv+1cvHIfZgkDTpMEY7MefwlMLtF/x/q0KRNja
 1VDHVIMqZaYo5M/K5OBIJergnUUAJ3aj1T1xIxxypTOMYCQv5ZfqjaNJGbJPObEJjOPBmM
 F7mvDHTl0qH16Y9NJDPaWvNgl97uq9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=V9HKilNBhJjDcr0SKyD5CwulF+/uQg+XoOlMis2RAAM=;
 b=HGW5A+7kLJW4TyFwwn5M/3hmCApFA4U77RxXbgYXBKeVghgiLWJ9CBURHBUqEh10dYFjuc
 uaNMnPQmMI7WI8CQ==
Received: by imap.suse.de (Postfix, from userid 51)
 id 4C9A611CC0; Wed,  2 Jun 2021 16:06:26 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6E21E11E51;
 Wed,  2 Jun 2021 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622638834;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=V9HKilNBhJjDcr0SKyD5CwulF+/uQg+XoOlMis2RAAM=;
 b=EnTOLbEwtc6gB2Qny+z70YZiSCgHRE6vdQNcB2dtl4j7n0WTvtbWHiyS237iXX2AA+iUIf
 79U0ivzkk1BPRJuPAdgDTsfVZ0w7PnVMIawJd47sIESv3ZLoUc4zx8MKkZEKG34sekSubu
 H4hDb4cF2rvatgOEutRzGnOEGlioKxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622638834;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=V9HKilNBhJjDcr0SKyD5CwulF+/uQg+XoOlMis2RAAM=;
 b=gkz5Acvw8qtylfxaeDxzvNcbVaxPfbvfSrY6jFtpynikxLL0jYDSPV0La7N+p7bj0vy3Yt
 jEUfFj4IYWOyE8Cg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kpl+GfKAt2CbMgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 02 Jun 2021 13:00:34 +0000
Date: Wed, 2 Jun 2021 15:00:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YLeA8KOphpVg3IDP@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

We have various files which states GPL v2. I guess the reason is that LTP merged
various other smaller testsuites in the past.

$ git grep -l "GNU GENERAL PUBLIC LICENSE"  | xargs sha1sum  | sort -u

acd633a2cfa753e6be4e5fc68db32fb3c4672fa5  testcases/kernel/hotplug/cpu_hotplug/COPYING
acd633a2cfa753e6be4e5fc68db32fb3c4672fa5  testcases/kernel/hotplug/memory_hotplug/COPYING
a7a897a4bde987e597c04f16a9c28f6d3f57916d  testcases/realtime/COPYING
b47456e2c1f38c40346ff00db976a2badf36b5e3  testcases/kernel/security/mmc_security/LICENSE
b47456e2c1f38c40346ff00db976a2badf36b5e3  utils/benchmark/ebizzy-0.3/LICENSE
c9661f3c6fdc868720828a34d74f1e22718c8388  testcases/open_posix_testsuite/COPYING
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/fork/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_cancel/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_cond_init/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_create/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_exit/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_getschedparam/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_kill/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_mutex_init/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_mutex_lock/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_mutex_trylock/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_once/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/pthread_self/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/sem_getvalue/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/sem_init/LICENCE
dfac199a7539a404407098a2541b9482279f690d  testcases/open_posix_testsuite/stress/threads/sem_open/LICENCE
dfac199a7539a404407098a2541b9482279f690d  utils/benchmark/kernbench-0.42/COPYING
0b184ad51ba2a79e85d2288d5fcf8a1ea0481ea4  testcases/kernel/io/writetest/gpl.txt
4cc77b90af91e615a64ae04893fdffa7939db84c  COPYING
74a8a6531a42e124df07ab5599aad63870fa0bd4  testcases/kernel/controllers/freezer/COPYING

The diff is mostly different FSF address.
COPYING has been updated in 945f9c69a, others are older; not sure if it's
lastest GPL v2 version.

testcases/kernel/hotplug/{cpu_hotplug,memory_hotplug}/COPYING mention:
"These tests are OSDL/LF and imported into LTP under GPLv2."

testcases/open_posix_testsuite/COPYING has extra BSD 2-clause license + other
test at the top:

All sourcecode generated from scratch by Ngie Cooper is BSD 2-clause
licensed. All legacy openposix test suite code is GPLv2+ licensed.

You must honor the respective license when copying code.

BSD 2-clause license:
...

I suppose it's safe to keep only single licence in testcases/open_posix_testsuite/,
but could we keep only COPYING in the root directory and delete the rest?
Or keep COPYING and testcases/open_posix_testsuite/COPYING only?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
