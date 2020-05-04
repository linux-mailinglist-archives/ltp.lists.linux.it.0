Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6901C396F
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 14:34:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC5673C5868
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 14:33:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5B3D13C269F
 for <ltp@lists.linux.it>; Mon,  4 May 2020 14:33:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFBEE14001E3
 for <ltp@lists.linux.it>; Mon,  4 May 2020 14:33:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF2DDABD0;
 Mon,  4 May 2020 12:33:56 +0000 (UTC)
Date: Mon, 4 May 2020 14:33:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200504123353.GA14280@dell5510>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502162744.9589-5-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] syscalls/fanotify: Use fanotify_save_fid()
 helper
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Reduce some boiler plate code in FAN_REPORT_FID tests and
> save fid only once per object instead of once per expected event.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
+1

>  static int setup_marks(unsigned int fd, struct test_case_t *tc)
> @@ -130,8 +125,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
>  					"kernel");
>  				return 1;
>  			} else if (errno == ENODEV &&
> -					!event_set[i].fsid.val[0] &&
> -					!event_set[i].fsid.val[1]) {
> +				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 0) &&
> +				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 1)) {

For the same reasons as the previous commits this diff is needed:
-				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 0) &&
-				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 1)) {
+				   !objects[i].fid.fsid.val[0] &&
+				   !objects[i].fid.fsid.val[1]) {


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
