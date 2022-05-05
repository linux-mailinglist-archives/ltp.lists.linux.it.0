Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4BE51C1D9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 May 2022 16:03:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D2203CA8A4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 May 2022 16:03:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 668073CA74A
 for <ltp@lists.linux.it>; Thu,  5 May 2022 16:02:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 531CE6002F4
 for <ltp@lists.linux.it>; Thu,  5 May 2022 16:02:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 98498219BE;
 Thu,  5 May 2022 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651759375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpmTeyn0GMe43GHNqasizb2MNVBHvi4v0T0Wr26qrXI=;
 b=a10zD4hI4bQlcDqdnynHjkTIiydDPDmKSN0HS/FItTsesO9TUDZ01z6UxQ6MudyRf8llW+
 ryY6PseUwvziiAdaD5YldkNXrvqcZdkNQwzpm1LTZs1hog57FqJBp4V4WKrVyse0eEgKOD
 Lk5/d8gAKhbnsVgT+T/lAMuMbzRmHR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651759375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpmTeyn0GMe43GHNqasizb2MNVBHvi4v0T0Wr26qrXI=;
 b=SNImsDPPXIY9lJzzJYfMdJ2lsFFijjHmu5sVUhT/QPpFgCC+2Ro1GWmHHwC9iMSyLxKBAJ
 TdpYZmvzGWbsW2AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 838CB13A65;
 Thu,  5 May 2022 14:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id izp0Hg/Zc2K2LQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 May 2022 14:02:55 +0000
Date: Thu, 5 May 2022 16:05:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YnPZl1jFQnj0up8I@yuki>
References: <20220428132656.11075-1-liwang@redhat.com>
 <20220428132656.11075-4-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428132656.11075-4-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] rtc02: loosen the compare precision with few
 seconds
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
Cc: Eirik Fuller <efuller@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> That possibly has time elapse between twice operations, especially
> on VM we can't guarantee the time precisely equal, let's lose a few
> seconds to make the test happy:
> 
>   tst_test.c:1433: TINFO: Timeout per run is 0h 10m 00s
>   rtc02.c:66: TINFO: To set RTC date/time is: 2020-10-09 13:23:30
>   rtc02.c:80: TINFO: read RTC date/time is: 2020-10-09 13:23:31
>   rtc02.c:83: TFAIL: RTC SET TEST
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Eirik Fuller <efuller@redhat.com>
> ---
>  testcases/kernel/device-drivers/rtc/rtc02.c | 46 +++++++++++++++++++--
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/device-drivers/rtc/rtc02.c b/testcases/kernel/device-drivers/rtc/rtc02.c
> index 6198a5d5d..a008971d5 100644
> --- a/testcases/kernel/device-drivers/rtc/rtc02.c
> +++ b/testcases/kernel/device-drivers/rtc/rtc02.c
> @@ -41,10 +41,48 @@ static char *rtctime_to_str(struct rtc_time *tm)
>  
>  static int rtc_tm_cmp(struct rtc_time *set_tm, struct rtc_time *read_tm)
>  {
> -	return !((set_tm->tm_sec == read_tm->tm_sec)
> -		&& (set_tm->tm_min == read_tm->tm_min)
> -		&& (set_tm->tm_hour == read_tm->tm_hour)
> -		&& (set_tm->tm_mday == read_tm->tm_mday)
> +	int delta = read_tm->tm_sec - set_tm->tm_sec;
> +
> +	/*
> +	 * To handle the normal and special situations:
> +	 * 1#
> +	 *       set_tm:  2022-04-28 13:00:50
> +	 *       read_tm: 2022-04-28 13:00:50
> +	 * 2#
> +	 *       set_tm:  2022-04-28 13:00:50
> +	 *       read_tm: 2022-04-28 13:00:51
> +	 * 3#
> +	 *       set_tm:  2022-04-28 13:00:59
> +	 *       read_tm: 2022-04-28 13:01:00
> +	 * 4#
> +	 *       set_tm:  2022-04-28 13:59:59
> +	 *       read_tm: 2022-04-28 14:00:00
> +	 *
> +	 * Note: as we have avoided testing around the zero
> +	 * clock, so it's impossible to hit situation 5#
> +	 *       set_tm:  2022-04-28 23:59:59
> +	 *       read_tm: 2022-04-29 00:00:00
> +	 */
> +
> +	/* 1~3 */
> +	if (set_tm->tm_hour == read_tm->tm_hour) {
> +		if (set_tm->tm_min == read_tm->tm_min - 1)
> +			delta += 60;
> +		else if (set_tm->tm_min != read_tm->tm_min)
> +			return 1;
> +	}
> +
> +	/* 4 */
> +	if ((set_tm->tm_hour == read_tm->tm_hour - 1) &&
> +			(set_tm->tm_min == read_tm->tm_min + 59))
> +		delta += 60;
> +	else if ((set_tm->tm_hour != read_tm->tm_hour))
> +		return 1;
> +
> +	if (delta < 0 || delta > 3)
> +		return 1;
> +
> +	return !((set_tm->tm_mday == read_tm->tm_mday)
>  		&& (set_tm->tm_mon == read_tm->tm_mon)
>  		&& (set_tm->tm_year == read_tm->tm_year));

Wouldn't it be easier to convert both dates into a 64bit timestamp and
compare the timestamps?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
