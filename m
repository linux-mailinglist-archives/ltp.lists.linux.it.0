Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F3BE228
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 18:15:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10A5C3C2100
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 18:15:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 00D023C2084
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 18:15:00 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A67EC1A01194
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 18:14:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6AEDAC52
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 16:14:58 +0000 (UTC)
Date: Wed, 25 Sep 2019 18:14:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190925161456.GA28071@rei.lan>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925135634.GA32581@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >  	do {
> > -		tst_res(TINFO, "== entry %d ==", ++i);
> > -
> >  		read_bytes = SAFE_READ(0, fd, &acct_struct, acct_size);
> 
> > +		if (i == 0 && read_bytes == 0) {
> > +			tst_res(TFAIL, "acct file is empty");
> > +			goto exit;
> > +		}
> > +
> > +		if (read_bytes != acct_size) {
> > +			tst_res(TFAIL, "incomplete read %i bytes, expected %i",
> > +			        read_bytes, acct_size);
> > +			goto exit;
> > +		}
> > +
> > +		tst_res(TINFO, "== entry %d ==", ++i);
> > +
> >  		if (v3)
> >  			ret = verify_acct(&acct_struct.v3, acct_struct.v3.ac_etime);
> >  		else
> > @@ -192,6 +203,7 @@ static void run(void)
> >  	else
> >  		tst_res(TPASS, "acct() wrote correct file contents!");
> 
> > +exit:
> >  	SAFE_CLOSE(fd);
> >  }
> 
> OK, on s390 where it's failing it actually catches "incomplete read":
> 
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> acct02.c:234: INFO: Verifying using 'struct acct_v3'
> acct02.c:187: INFO: == entry 1 ==
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:187: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 54783 (54781)
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:183: FAIL: incomplete read 0 bytes, expected 64

Isn't that just end-of-file? I guess that we should just break the loop
if i != 0 and read returned 0.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
