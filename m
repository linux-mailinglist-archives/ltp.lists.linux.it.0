Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C921C3494
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:37:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99EF63C584B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:37:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 554903C26B7
 for <ltp@lists.linux.it>; Sun,  3 May 2020 10:43:12 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 16B6D1A0068E
 for <ltp@lists.linux.it>; Sun,  3 May 2020 10:43:12 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id h12so5714473pjz.1
 for <ltp@lists.linux.it>; Sun, 03 May 2020 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EfVq/2cjm9x6afYCXLHJYAfpOKL7mDJjnsQA9TWifo8=;
 b=i59Wki14N4IrXB1ArVznM0Ludapbkjr0xnCLSz3UJxzqxw8LPGq7zRrVBcCGVk0/rX
 RovL1e589DII3AdRtdeUDPGaRLZZxj4dwVkjBa+0/7kbl39Xo3Xec2DTUH6OsXQW5+QS
 CqK/y2BC8bVnBTqTyRLVY7lG/Raw6kVoReF+a99Hn0jMaHBOfcA4RB0j+pKioXaODYND
 9b7qRssclAgo4/ZCyDr6K+t9TPzNU54eDkVSPLpNnJEZciwGCMlFbSobllMt6vatOllx
 edOsLC/Sr7+WvxRjbAZAWLYPZ+fo/ysDzxcOU3qWCA8Db/hCvtWpN/DtqTqZLqXu2G1J
 1Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EfVq/2cjm9x6afYCXLHJYAfpOKL7mDJjnsQA9TWifo8=;
 b=XvIPAPsOMQ0y+IjBdSH7pVoFiCn00r87hVymtxnir0/t5PdIo349h4WDMP9CyGzPaa
 azNQ5W1e1rYp5cMonXlw0Qzlwi2sgl9KgjRPTR5/28bSISORLPWCEt4x/Kw+J8Oz3lhH
 TVg2zwk93l9vzo/WNYkKOqEiTy1d0J/TPJhaq8emocW1Wu1LMZWfZtqANGgQ6w7NoJip
 eYyLBE3AdVRtIgtr+BAA0WkpgceAfZiNxXOxhFWB88uX0hRPMgjF4rMfigEp2bKQnyPi
 YQv1Kkc0vrpBSgp0Ih7/LgbgGb9ReB1ETx0HzAsqqEWF/UrSxaEkOzCLcTrp/amZXpd2
 2KiA==
X-Gm-Message-State: AGi0PublYibMqaOmXUH55uvtjxvurrNpQcVSEX7LcnFa2wCXP2cHOQSM
 mOJ5hLPFDnNlwmdH1puRKSiR
X-Google-Smtp-Source: APiQypJEmxB57jWJMNyqjEZ0zYIyMHg5Q5aSrD6unARaD7IgBsrjLdeTHOUTrOVrbtfPDtO6NXZo9Q==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr12246900plk.74.1588495390228; 
 Sun, 03 May 2020 01:43:10 -0700 (PDT)
Received: from morpheus.bobrowski.net (49.37.70.115.static.exetel.com.au.
 [115.70.37.49])
 by smtp.gmail.com with ESMTPSA id f26sm6069716pfn.183.2020.05.03.01.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 01:43:09 -0700 (PDT)
Date: Sun, 3 May 2020 18:43:03 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200503084301.GA2080@morpheus.bobrowski.net>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502162744.9589-5-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, May 02, 2020 at 07:27:44PM +0300, Amir Goldstein wrote:
> Reduce some boiler plate code in FAN_REPORT_FID tests and
> save fid only once per object instead of once per expected event.
> 
> Suggested-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---

Nice, thanks for cleaning up those other tests too. Changes look fine
to me.

Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
