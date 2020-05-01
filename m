Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DE1C3490
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 672FD3C5847
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 94FC13C5DFE
 for <ltp@lists.linux.it>; Fri,  1 May 2020 10:09:11 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6102A1A00CBD
 for <ltp@lists.linux.it>; Fri,  1 May 2020 10:09:11 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id l20so4260711pgb.11
 for <ltp@lists.linux.it>; Fri, 01 May 2020 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9kAR9DC9RfeVG+Ufz/4HP/pzOt0XIEFG/FEFk2zWHsM=;
 b=caCvLrjdc+JVo/0zq0b6D5W+xpEMQmopPLiUDq5XltN8ugKbNafpEBX2IBTS9u9pe+
 kYQrSLP5uQaHG780uf9I+CNEZb65tjvpjJvBBaa/BdGpmv3Fyame3o6JGahiI9U7zJUB
 Qtf2kql6S/vX8vICDwozMBMUJN8qkYTsTGM7PdEWiGv0bGtLeFAriZyr83kVlyaZpXhT
 TqQp6L/c8kJWRQlCxu6uBvCp6nFY24oun3sqPbTplUCj9TEvBW8QQNs1PbAg4yEjGJYC
 Jf+3d6q/CAn8HZBpli0xTIIE5MOkzKUjjFCaFekAKm+vo+WCxwh4g33xgzFjsK3poq9p
 jQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9kAR9DC9RfeVG+Ufz/4HP/pzOt0XIEFG/FEFk2zWHsM=;
 b=BWYAQF1wuVke23PiMr7xazJDkuzEq9nh00IYkOJ+XWvsZR+Ov4Trpil0ZuzeCItZwU
 Hcl3kSvuu2PY5nolVdCU/UYSeWbuhAemG78lJa17SKHbjv7svDFavm61LJfd44FmJ3Qb
 BhbveDYVRUNFNej/pJBoqIEyIJi+cz6B4mDegv2DcCDeinS6uTHBCQx9dtrrvF79SRWu
 MHHOR/OHagPqdJDwgd0ob24cpMpuBS5HEUz9JF6jPlp8rWQYat/VZblotJ7qy82bk7Ah
 pHI/2Z1ZVdN0wZsua9hKbHlYayPUPbld3EOgXJvjijhra0e/XRCoPxaP+i4ZFQZe7deF
 5sUA==
X-Gm-Message-State: AGi0PuYWP0aFUnNcbznOuYfsE//BdutdG/H5AqHwe/gDk9ngYGEuRntJ
 6MTrsbh0q+n+LEQqCrhsH//C
X-Google-Smtp-Source: APiQypIq3wW1Zr9iWtMyyOoBQ1XacGr3aN6T711OGbgjDI+p0v2bZpwbbJEIC2q04VExhi3QfTiDoQ==
X-Received: by 2002:a62:144b:: with SMTP id 72mr3098285pfu.246.1588320549683; 
 Fri, 01 May 2020 01:09:09 -0700 (PDT)
Received: from morpheus.bobrowski.net (49.37.70.115.static.exetel.com.au.
 [115.70.37.49])
 by smtp.gmail.com with ESMTPSA id o68sm1616866pfb.206.2020.05.01.01.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 01:09:09 -0700 (PDT)
Date: Fri, 1 May 2020 18:09:04 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200501080902.GA2782@morpheus.bobrowski.net>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-3-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-3-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
Subject: Re: [LTP] [PATCH 2/4] syscalls/fanotify15: Minor corrections
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 21, 2020 at 09:50:00AM +0300, Amir Goldstein wrote:
>  static void do_test(void)
> @@ -55,23 +61,24 @@ static void do_test(void)
>  	struct fanotify_event_metadata *metadata;
>  	struct fanotify_event_info_fid *event_fid;
>  
> +

^ Unnecessary white line entered here?

>  	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> -				FAN_CREATE | FAN_DELETE | FAN_ATTRIB |
> -				FAN_MOVED_FROM | FAN_MOVED_TO |
> -				FAN_DELETE_SELF | FAN_ONDIR,
> +				FAN_CREATE | FAN_DELETE | FAN_MOVE |
> +				FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
>  				AT_FDCWD, TEST_DIR) == -1) {

...

> -	/* Generate a sequence of events */
> +	/* All dirent events on testdir are merged */
>  	event_set[count].mask = FAN_CREATE | FAN_MOVED_FROM | FAN_MOVED_TO | \
>  				FAN_DELETE;

Just a suggestion, perhaps we can modify the above line to the following:

	event_set[count].mask = FAN_CREATE | FAN_MOVE | FAN_DELETE;

Also, I believe that we can generally replace all instances of
FAN_MOVED_FROM | FAN_MOVED_TO with FAN_MOVE within this file.

The rest looks good to me.

Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
