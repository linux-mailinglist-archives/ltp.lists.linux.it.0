Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0E29B78B
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 16:44:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD6B13C5605
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 16:44:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0DF7C3C311B
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 16:44:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AC8AE1000B7E
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 16:44:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C3F5AC2F;
 Tue, 27 Oct 2020 15:44:53 +0000 (UTC)
Date: Tue, 27 Oct 2020 16:45:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20201027154529.GA20643@yuki.lan>
References: <20201027110446.20416-1-chrubis@suse.cz>
 <20201027110446.20416-2-chrubis@suse.cz> <874kmfvg3q.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kmfvg3q.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add generic boolean expression parser
 and eval
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +/*
> > + * Note that we avoid modifying the list until the end so that the caller can
> > + * free memory correctly, which is the reason we have a stack for
> > parentesis
> 
> If you use a new vector/stack for the output queue instead of an
> intrusive list then this problem should go away. We have an upper bound
> for any token/expr vector which is the length of the input string. So it
> is possible to preallocate an input array instead of using a dynamically
> allocated linked list.

Or we can run the tokenizer twice and first time only record number of
tokens...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
