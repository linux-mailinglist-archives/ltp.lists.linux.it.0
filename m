Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 909762DD18B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:36:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8B93C57D0
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:36:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 143A93C57C6
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:36:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9307120096E
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:36:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0761B74F
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 12:36:16 +0000 (UTC)
Date: Thu, 17 Dec 2020 13:36:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X9tQv3da2WftcH0z@pevik>
References: <20201217121520.25713-1-pvorel@suse.cz>
 <20201217121520.25713-2-pvorel@suse.cz> <X9tNEoMlQsCaSZPD@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9tNEoMlQsCaSZPD@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] docparse/parse.sh: Fix parsing on dash
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

> Hi!
> > bash keeps escape sequences (e.g. \t and \n) when using echo:

> > $ a="-v\tverbose output\n"; echo "$a"
> > -v\tverbose output\n
> > $

> > But dash interprets them (behaves like echo -e on bash):

> > $ a="-v\tverbose output\n"; echo -e "$a"
> > -e -v	verbose output

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Thanks for both reviews!

> Can we remove the \t from the perf_event_open02.c as well please? I
> doubt that it will do any good when we pass the strings into asciidoc
> parser...
Sure, I'll replace it with <tab>.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
