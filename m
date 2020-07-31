Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CA233EAA
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 07:26:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 960873C4BAA
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 07:26:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 20B513C0EAD
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 07:26:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8FF03140173E
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 07:26:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B24BAD20;
 Fri, 31 Jul 2020 05:26:48 +0000 (UTC)
Date: Fri, 31 Jul 2020 07:26:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@kernel.org>
Message-ID: <20200731052633.GA3900@dell5510>
References: <20200727223041.13110-1-pvorel@suse.cz>
 <20200727223041.13110-3-pvorel@suse.cz>
 <1596138638.25003.6.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596138638.25003.6.camel@kernel.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/4] IMA: Add policy related helpers
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
Cc: balajib@linux.microsoft.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> Other than inverting the [ -f $IMA_POLICY ] tests.
Thanks for catching obvious error! Coding late night...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
