Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D74BF31C710
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 08:59:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9990F3C593A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 08:59:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B80873C5905
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 08:59:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 202011000AED
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 08:59:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D018AB4C;
 Tue, 16 Feb 2021 07:59:03 +0000 (UTC)
Date: Tue, 16 Feb 2021 08:59:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YCt7RUD/PeRkupr7@pevik>
References: <20210216074748.6873-1-rpalethorpe@suse.com>
 <20210216074748.6873-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216074748.6873-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] close_range02: Add simpler test and Check
 invalid params
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

Hi Richard,

> This adds some coverage for invalid parameters and a min fd above or
> on the limits. There is also some overlap with close_range01, but this
> test is simpler and has less requirements.

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---

> V2: Try Closing the path file descriptor at the end if it was opened
>     to prevent hitting the FD limit with -i

Thanks! And yes, using close_range() is much better than plain close().

Waiting little longer for feedback before merging.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
