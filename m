Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B917881D
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:15:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8791E3C1D55
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:15:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 66D0C3C1CE5
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:15:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD67310000C0
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:15:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91646AEFD;
 Mon, 29 Jul 2019 09:15:52 +0000 (UTC)
Date: Mon, 29 Jul 2019 11:15:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ammy Yi <ammy.yi@intel.com>
Message-ID: <20190729091556.GA31665@dell5510>
References: <20190613021138.5313-1-ammy.yi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613021138.5313-1-ammy.yi@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 ltp] Add 4 more cases for Intel PT.
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

Hi Ammy,

> 1. Add Intel PT sanpshot mode test.
> 2. Add Intel PT exclude user trace mode test.
> 3. Add Intel PT exclude kernel trace mode test.
> 4. Add Intel PT disable branch trace mode test.

> Signed-off-by: Ammy Yi <ammy.yi@intel.com>

Merged with tiny formatting changes.
Thanks for your patch!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
