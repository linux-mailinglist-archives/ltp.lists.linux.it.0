Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A171022BC02
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 04:33:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A50D3C4D50
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 04:33:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0AA7B3C18FA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 04:33:44 +0200 (CEST)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A211E1A00640
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 04:33:43 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id mn17so4356988pjb.4
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 19:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4QZnD1h9kL5QAOdqKCMlSUHtZ7mpYacziyLOf2lGT8w=;
 b=OA/+U6hrbPs0K6hdHWjkVEH4UvYSqN/+sawkEXOgchSzkY3BVtM7UfX4pUhs4/TwiK
 EPef3S3TWRgxoryUo6LDavUOI0hwqxVuBkyfPjBr7dZZ9PQZGoHWfurPpIoNvOKZls5g
 tlN1klJUMsOVB5mFGzy5fM0TZolZsQWk8IPr4g4COLaax56qDkgDMRTDcSu3Ipo1Wiy4
 4LCKHkJxrwpAxRm9Q9kfdsmPz3SdIgaJZCISPwLuMsuqTPRcM0zm1yoW33QhXK0ApRgO
 Fs64kB2QPu6NLlDLjAo7NFfcLQ+ctMxfC2GAKZAURjnOJanf+KyCo23nCiof8t+fTYr7
 Y2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4QZnD1h9kL5QAOdqKCMlSUHtZ7mpYacziyLOf2lGT8w=;
 b=tauPJqG79swLxlElCS1hOH+AF8l5o8PvRU/Ljz8yiDzDRCRqhpdOrAGynSrcXMGkvh
 72GfMVz2+4cNHgq61Ner2LnaJfsYF+NrmAG3ViXOlQv3QSo8vmLYS9mHweTvkmvlTKCG
 2dYsS2VMHCrOSPmmQe1LQVupxIR8CAMJXdICWuQwyU3XSzSSNH+p0OxuD8KBXOAJ3Gii
 u4YCYmDYlGkWr3jYbaHuHn6Q0UeTbIfigO70GKOCSbxz4llivxpuCZQA1iua8Tz/X7IF
 Mv6gy9fyeQY3fB9BlXeFhz8CHrFsCvLsFFRWXeSw8GUoqDrETONzDDb3YhFt5rN0j/s/
 i61g==
X-Gm-Message-State: AOAM532mOKxr0NGt+bAAsVPTvcIqDP97LfXBKYJ1/RESlgYuFsbBUULq
 f0AHdf3zrULOquD5lACDV4oZtA==
X-Google-Smtp-Source: ABdhPJx0JfLKvFSFPeLLkcsnYiocWZ6pwQbs/yZV92xb6cNDEfSZY3vDiTYdIkhp0+3/KNA+d24zVw==
X-Received: by 2002:a17:902:d392:: with SMTP id
 e18mr6058084pld.139.1595558022046; 
 Thu, 23 Jul 2020 19:33:42 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id w17sm4400054pge.10.2020.07.23.19.33.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 19:33:41 -0700 (PDT)
Date: Fri, 24 Jul 2020 08:03:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200724023338.47s5qfcaolspjmfv@vireshk-mac-ubuntu>
References: <6030fa8c1deda3aab977c7d5745c117fda87708a.1593152309.git.viresh.kumar@linaro.org>
 <8485ad1373a22b8f512eb17cf65d7662a7ede619.1594035467.git.viresh.kumar@linaro.org>
 <20200723194445.GC9768@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723194445.GC9768@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7.1 07/19] syscalls/futex: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23-07-20, 21:44, Cyril Hrubis wrote:
> Hi!
> Pushed with minor changes, thanks.
> 
> Here is the diff, if something there is puzzling I will explain it
> tomorrow, I'm too tired to do it now...

No, it looks fine, thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
