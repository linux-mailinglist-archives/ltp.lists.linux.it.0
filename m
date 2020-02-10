Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E51575B9
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:44:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B4933C24DD
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:44:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2EC373C207E
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:44:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 345752009D3
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:44:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0797AD2C;
 Mon, 10 Feb 2020 12:44:21 +0000 (UTC)
Date: Mon, 10 Feb 2020 13:44:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200210124420.GA14605@dell5510>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207152406.GA16951@rei.lan>
 <285421765.6549099.1581090469387.JavaMail.zimbra@redhat.com>
 <20200207155730.GB16951@rei.lan>
 <748200464.6799894.1581322752135.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <748200464.6799894.1581322752135.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/2] safe_macros: Use tst_umount() in
 safe_umount()
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

Hi,

> > +               if (err != EBUSY) {
> > +                       errno = err;
> > +                       return ret;
> > +               }
> > +
> >                 usleep(100000);
> >         }

> Works for me too, I don't recall seeing anything else than EBUSY.

Thanks!
Just in case I've sent this commit as v2, followed with "safe_macros: Use
tst_umount() in safe_umount()" (without Zorro's fsmount commit).
IMHO now is docs about tst_umount() correct.

https://patchwork.ozlabs.org/patch/1235811/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
