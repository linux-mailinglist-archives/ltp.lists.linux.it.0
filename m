Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7DF90A6
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 14:30:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49ACF3C2642
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 14:30:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F262A3C2635
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 14:30:21 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 10FAD1001957
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 14:30:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 398DBB28F;
 Tue, 12 Nov 2019 13:30:20 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:30:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191112133018.GA11433@dell5510>
References: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
 <20191112123744.GA760@dell5510>
 <1574856631.11670519.1573563157342.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574856631.11670519.1573563157342.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: relax ac_btime checks
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

> > > ac_btime is calculated back from current time and isn't accurate.
> > > Problems include nanoseconds accumulation (lags behind gettimeofday),
> > > suspend/resume isn't taken into account and any adjtime() (like DST
> > > change) will cause ac_btime to jump as well.

> > > Relax the condition to ~2h around gettimeofday value at start of
> > > the test. That should be enough to cover usual DST time jumps.

> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > Tested-by: Petr Vorel <pvorel@suse.cz>
> > on both 390x and intel.

> > LGTM, although on in intel I got quite a lot of entries:

> > acct02.c:202: INFO: Number of accounting file entries tested: 159

> That could be normal if there was something running in the background.
> Do you have full output? What was the ac_comm string in those entries?

OK, this is caused only by compiling LTP on background.
Thus not relevant to us.

Just if you're curious, sending part of output with 530 entries.

Kind regards,
Petr

tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
acct02.c:238: INFO: Verifying using 'struct acct_v3'
acct02.c:191: INFO: == entry 1 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('cc1')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (256)
acct02.c:139: INFO: ac_ppid != 755 (760)
acct02.c:191: INFO: == entry 2 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('gcc')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (256)
acct02.c:139: INFO: ac_ppid != 755 (759)
acct02.c:191: INFO: == entry 3 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (256)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 4 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('grep')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 5 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('cat')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 6 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('mv')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 7 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('sed')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 8 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('rm')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 9 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('grep')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (768)
acct02.c:191: INFO: == entry 10 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 11 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)

...
acct02.c:191: INFO: == entry 522 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (1285)
acct02.c:191: INFO: == entry 523 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('cat')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 524 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (1290)
acct02.c:191: INFO: == entry 525 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('sed')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (1292)
acct02.c:191: INFO: == entry 526 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (1290)
acct02.c:191: INFO: == entry 527 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('configure')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 528 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('cat')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 529 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('rm')
acct02.c:98: INFO: ac_uid != 0 (1000)
acct02.c:104: INFO: ac_gid != 0 (100)
acct02.c:131: INFO: ac_exitcode != 32768 (0)
acct02.c:139: INFO: ac_ppid != 755 (393)
acct02.c:191: INFO: == entry 530 ==
acct02.c:202: INFO: Number of accounting file entries tested: 530
acct02.c:208: PASS: acct() wrote correct file contents!

Summary:
passed   1
failed   0
skipped  0
warnings 0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
