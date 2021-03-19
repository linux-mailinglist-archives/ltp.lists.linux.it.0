Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1D341782
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 09:29:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C1CB3C6023
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 09:29:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6F8133C2C33
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 09:29:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DA956140012C
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 09:29:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 176DBAC1F;
 Fri, 19 Mar 2021 08:29:03 +0000 (UTC)
Date: Fri, 19 Mar 2021 09:29:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <YFRgzbKPtVBK/l5d@pevik>
References: <20210318162409.9871-1-mdoucha@suse.cz> <YFOcOJP4innlbIk4@pevik>
 <920d81b2-567a-4e28-58f7-b27151b1cad7@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <920d81b2-567a-4e28-58f7-b27151b1cad7@163.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> > > +	if (tst_variant =3D=3D 1)
> > > +		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
> > > +#endif
> > Although I understand why you want to quit only tests with root
> > (only these fail), it's a bit confusing to test with user nobody
> > and then quit the same testing with root.

> I don't get this.=A0 Martin only wants to skip libc test when undefined a=
nd it
> doesn't matter which user we use.

if (tst_variant =3D=3D 1)
	tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");

means:

# /semctl09
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
semctl09.c:76: TINFO: Test SYS_semctl syscall
semctl09.c:141: TINFO: Test SEM_STAT_ANY with nobody user
semctl09.c:163: TPASS: SEM_INFO returned valid index 19 to semid 19
semctl09.c:173: TPASS: Counted used =3D 1
semctl09.c:121: TPASS: semset_cnt =3D 1
semctl09.c:128: TPASS: sen_cnt =3D 2
semctl09.c:141: TINFO: Test SEM_STAT_ANY with root user
semctl09.c:163: TPASS: SEM_INFO returned valid index 19 to semid 19
semctl09.c:173: TPASS: Counted used =3D 1
semctl09.c:121: TPASS: semset_cnt =3D 1
semctl09.c:128: TPASS: sen_cnt =3D 2
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
semctl09.c:191: TCONF: libc does not support semctl(SEM_STAT_ANY)

i.e. run first test with user nobody and skip the second.
It's a bit confusing to test anything with SEM_STAT_ANY and then state
TCONF: libc does not support semctl(SEM_STAT_ANY) :)

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
