Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 366916FF82
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 14:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0F3F3C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 14:24:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6C40C3C04F0
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 14:24:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D55796009A0
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 14:24:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 746D1AF27
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 12:24:01 +0000 (UTC)
Date: Mon, 22 Jul 2019 14:24:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190722122400.GA13282@rei.lan>
References: <20190719113721.6285-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719113721.6285-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] timers/timer_create0{2, 3,
 4}: Ported to new library
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
Pushed with changes to the timer_create04.c, thanks.

I've changed the timer_create04 not to iterate over all the clock types,
which does not make much sense for invalid input tests and rather than
that I've added a few more invalid tests, I've also made sure that the
we get EINVAL with different parts of the sigev structure filled with
wrong values instead of memseting it to a constant.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
