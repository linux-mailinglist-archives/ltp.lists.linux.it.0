Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC51864EC
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 07:10:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0B093C56B4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 07:09:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 12AAD3C1411
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 07:09:55 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 106FB1400B93
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 07:09:55 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id h11so7506107plk.7
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 23:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LrIK2JQOnhfA4T6tqGN6ljPJb6TzOzmnbPQ+IIUYJ/I=;
 b=zLCiTXiR9e4bGofHFM/NBIqKyYy1URdaltqlWk5zVh6vl+5qd27yKB6tingeKQ3/2Z
 DXCPQa5A/V9Sv9th71Mgj1LuQWfrfWO4hlkMKm+N7tba7W6BFtsJTrqIZHxnI3rOJgAV
 7TtCIefemQyBeV6FacEzwykoOlVuR6mKg1ZyibV2vKYScpg6RC4Dzx3AIf2M3a0rJb2q
 Yvpg+iN8bylotl88GEz+r0kZg+wdGfYMm+yzQCVfVzM8UYAL7SM2AENcxiQPMTLMgR6R
 27r4uI2l6uI/ntIz2zKV5xnfb/oUX8JZQlfm3kCIS+VqToM3x3T70nZtiKUDg2u4zJyJ
 ZxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LrIK2JQOnhfA4T6tqGN6ljPJb6TzOzmnbPQ+IIUYJ/I=;
 b=jc0t08COjKQhV/dsFemlmuXVQDtU9EK4otVkDpWv1pd5B6knHE3AXNS3pmZY0n36O7
 XZZ8XNhUuFwXCCPTKRtvMAu1nFHPv/TszVB2RN6SC7Y6HFID6DrcPE7HxEaiQ7EX5RJg
 P69ZYeOz9mXtk/mUE4JxL2qVW6wfapH8/37l8nzKmxxf1lJRv5dB+UBFrFoYR2TKX9UY
 2+MknJ0A7j+fZKu0oxKXpKn6uYUBFmGeObr2+o97/9j3YY3hr6As/9RJqDlWyAvMGVfG
 +WzuZDnMhSm+ZMzm5dNVGeaqlm95zV3MpGjdvXl1GCwQDDmrMNZwcotU6yQP0/denKne
 2L8g==
X-Gm-Message-State: ANhLgQ1R2eI/VCgCRipkqgtLssXiCj7OrzT/Q0qbObDFEc76lRES9aTh
 qCUWMI9WfwGpuhjprwj6z1oWjQ==
X-Google-Smtp-Source: ADFU+vuuUZPkf6jax1Tze14M/5nVX0fum6fyKwomf+hVJUsXjNni/pm1538k8xpEPDdXunii0w/DsQ==
X-Received: by 2002:a17:90b:282:: with SMTP id
 az2mr1018733pjb.13.1584338993447; 
 Sun, 15 Mar 2020 23:09:53 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id ci14sm7849179pjb.37.2020.03.15.23.09.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Mar 2020 23:09:52 -0700 (PDT)
Date: Mon, 16 Mar 2020 11:39:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200316060950.6o52idjfocdibrn6@vireshk-i7>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
 <20200312191025.GD3803@rei.lan>
 <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
 <20200313080334.GA6597@rei.lan>
 <20200313084853.lnfi4dnyoht5yupi@vireshk-i7>
 <20200313120943.GA32033@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313120943.GA32033@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13-03-20, 13:09, Petr Vorel wrote:
> Hi Viresh,
> 
> > I didn't knew about the -i option, yeah your change makes sense now :)
> NOTE: all test (both C and shell) should support -h (inherited from the
> library), to display options.

I didn't thought about that as well earlier, but then tried -h option
with the executable earlier before your mail came and it worked. So I
assume I don't have to do anything special to support the -h option as
it is already working fine right now ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
