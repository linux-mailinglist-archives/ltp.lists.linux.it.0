Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD524A58C1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 16:05:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B6C33C20E7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 16:05:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 819003C20E7
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 16:05:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 499C41A00CAE
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 16:05:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53506AD78;
 Mon,  2 Sep 2019 14:05:35 +0000 (UTC)
Date: Mon, 2 Sep 2019 16:05:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190902140531.GA10860@rei.lan>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <20190826111024.19053-3-chrubis@suse.cz>
 <456316863.8154593.1566823938723.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <456316863.8154593.1566823938723.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/4] BPF: Sanity check creating and updating
 maps
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Small nit (maybe personal preference), I'd rather make this check for
> map_types.attr, as opposed to test number / some position in array.

Sounds good.

> > +	case 0:
> > +		if (TST_RET != -1 || TST_ERR != ENOENT) {
> > +			tst_res(TFAIL | TTERRNO,
> > +				"Empty hash map lookup should fail with ENOENT");
> > +		} else {
> > +			tst_res(TPASS | TTERRNO, "Empty hash map lookup");
> > +		}
> > +	break;
> > +	case 1:
> > +		if (TST_RET != -1) {
> > +			for (i = 0;;) {
> > +				if (val_get[i] != 0) {
> > +					tst_res(TFAIL,
> > +						"Preallocated array map val not zero");
> 
> If we hit this TFAIL, will the loop terminate?

My bad, I will change this to use proper for() loop.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
