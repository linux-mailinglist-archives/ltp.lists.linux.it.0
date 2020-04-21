Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C29131B2E7B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 19:41:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32F453C29CE
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 19:41:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3D0A53C071A
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 19:41:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C01DE1A00889
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 19:41:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C37B7ACB8;
 Tue, 21 Apr 2020 17:41:05 +0000 (UTC)
Date: Tue, 21 Apr 2020 19:41:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200421174104.GA4344@dell5510>
References: <20200416104548.27897-1-pvorel@suse.cz>
 <20200416104548.27897-2-pvorel@suse.cz>
 <ec51559c-09e3-b518-f144-4246c68f1bd9@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec51559c-09e3-b518-f144-4246c68f1bd9@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] net/sendfile01.sh: Rewrite into new API
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

Hi Alexey,

...
> > +	tst_res TINFO "wait for the server to start"
> > +	sleep 1

> It would be better to replace 'sleep' with a wait-loop and check that the
> port in the listen state there, e.g with ss -ltp | grep "$port.*testsf"

I'm sorry, I overlooked this. I'm sorry, merged without this.
I'll implement it separately.
Thanks for your review.

...
> > +		diff $file $lfile > /dev/null
> > +		ret=$?
> > +		if [ $ret -eq 0 ]; then
> > +			tst_res TPASS "coped file is the same as the original"
> > +		elif [ $ret -gt 1 ]; then
> > +			tst_brk TFAIL "cannot compare files"
> > +		else
> > +			tst_res TFAIL "the copied file differs from the original"


> EXPECT_PASS diff $lfile
Fixed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
