Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B416A192B00
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 15:19:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 528B13C4BF9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 15:19:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 80B523C042E
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 15:19:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E78E514013A2
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 15:19:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F3A8AD7C
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 14:19:44 +0000 (UTC)
Date: Wed, 25 Mar 2020 15:19:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200325141944.GA4021@yuki.lan>
References: <20200325103734.31295-1-mdoucha@suse.cz>
 <875zeszglp.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zeszglp.fsf@our.domain.is.not.set>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix use after stack unwind in fzsync lib
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
> >         pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> >         pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> > -       return t.func(t.arg);
> > +       ret = t->func(t->arg);
> > +       free(t);
> 
> Why not use SAFE_FREE?

free() does not report errors, there is no such thing as SAFE_FREE()

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
