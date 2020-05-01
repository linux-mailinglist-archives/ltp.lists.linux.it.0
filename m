Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC41C348D
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9078F3C5853
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 47F0E3C26C4
 for <ltp@lists.linux.it>; Fri,  1 May 2020 09:17:52 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E9EAB1A00995
 for <ltp@lists.linux.it>; Fri,  1 May 2020 09:17:50 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id n16so4221691pgb.7
 for <ltp@lists.linux.it>; Fri, 01 May 2020 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iJJ2M8R6maE57r6vzwrF54jp1WwxW7sGA6pnjaebaFc=;
 b=YsHdXHhWakC2zg1yAJX0k1LB6gEWWe4imy6CXxXEKyyrtDxd0bbJ/saoG2Q9hmpYWW
 V4UP/OPjxA7lWYgQOtWpGTBIp0zlOqQaxB/6CeNqoZaDx/sYegj67p1z7xfQJhmOYoYT
 VAi9rGaWtMqay/WlVpmFX0MCRrwJ9tCju9whwB0Ib8ePlqSKiKkogcqKDM0aQRBIMziL
 QrdPgFCk7RzqkCJLjCOISoMs1qFO4x6JsLLpOnhjcHtXNHwa4W2XK03lRe0MWEQvKZYH
 3xIMRw2iRVbBn/GoiwgFNsCn1XGDIZwJceqlxxiFfGAhN57iSUJYms3VFQsNmWcmrqum
 UaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iJJ2M8R6maE57r6vzwrF54jp1WwxW7sGA6pnjaebaFc=;
 b=jJgQKDGvN0b+d0dtLl7k43GiVGjo8/WElJow+R/XOkThNfs6z5AMUv2j+NleDOjuSi
 YHHw1aQ138z60aAcZB/I5lP2gL4+9EmZDTa0bOUn6CBK5+P7fLrzuXJsSqlrN7OfR1u3
 pXcwaF/NrIlAZjHcXgsavYtyzxWb2zzQH6tRdX5ddeQzG0Oy0r0y6oLZT3/9fChJDfNQ
 F6zgWMU66/I2i9vrEhul7/dl+xhST2uQ122929o9xwul64fSOZ6bsRqsDVV2rROT+xV+
 0JIJv8HUKKBuoN79edrUfzyzVmMQFgiUnqWFcSOPF/BZTaHSv68qWNb6oK4ZSYdHhiiB
 wuIg==
X-Gm-Message-State: AGi0PuY/z1XRAfxzaj/p/4Y0lbUMT31GhcE7eHo1jY+lL5tObEyArvjI
 vJqWibb88Lc8QF++iug6uUrU
X-Google-Smtp-Source: APiQypI6mM52uEq7BchYEYZJ3/AGJZpKgQFStR7ldQuklf2NC/d5mPt1A67z2RXlsG3hQCpuk+1Ydg==
X-Received: by 2002:a62:6585:: with SMTP id z127mr2910152pfb.217.1588317468935; 
 Fri, 01 May 2020 00:17:48 -0700 (PDT)
Received: from morpheus.bobrowski.net (49.37.70.115.static.exetel.com.au.
 [115.70.37.49])
 by smtp.gmail.com with ESMTPSA id 135sm1510436pfu.125.2020.05.01.00.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 00:17:48 -0700 (PDT)
Date: Fri, 1 May 2020 17:17:42 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200501071740.GA2217@morpheus.bobrowski.net>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-2-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-2-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
Subject: Re: [LTP] [PATCH 1/4] syscalls/fanotify09: Check merging of events
 on directories
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

On Tue, Apr 21, 2020 at 09:49:59AM +0300, Amir Goldstein wrote:
> +static void event_res(int ttype, int group,
> +		      struct fanotify_event_metadata *event)
> +{
> +	int len;
> +	sprintf(symlnk, "/proc/self/fd/%d", event->fd);
> +	len = readlink(symlnk, fdpath, sizeof(fdpath));
> +	if (len < 0)
> +		len = 0;
> +	fdpath[len] = 0;
> +	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d path=%s",
> +		group, (unsigned long long)event->mask,
> +		(unsigned)event->pid, event->fd, fdpath);
> +}

Nice helper, although it would be nice not to see all these statements
clunked together like this.

> -	 * generate FAN_CLOSE_NOWRITE event on a child subdir.
> +	 * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
  	   ^ s/g/G :P

Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
