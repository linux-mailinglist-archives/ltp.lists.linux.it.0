Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017E16F682
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 05:34:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B231D3C137A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 05:34:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 47B4F3C0878
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 05:34:41 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 74C911400968
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 05:34:40 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id u12so649793pgb.10
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 20:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cYFXtnPjxkwXVpOEkFeRU1z+NIYCj77IG3IGN52gWZk=;
 b=HyCnYcBQt7iUcjzfSdeJyy/XnHuWs7rkATkEGByuHI3OqFaLp01+DR2X+EAAy+avMm
 eCjKdMp0UbQoXBzK8drfTGx1BOhH/9w1zw+7fzFd9Frtc++tC4mnh4uTRIx1LFSZ259U
 KLkMbJH+kKEM2QMs4DipAzd4+FqMELYNTNpjIWC6oQgfFi8ePP26INvFbXRzX5sg/gmc
 d/4uRo8CVkLoACEKfOuRYk3rIUhsLwPSxoT/8cbYsiO9W0IpDYnuYH57vo9QFJ4xwwOc
 Me2tiQMykHhJYIlDpHQ9H8PS6OK5XUOcVLvxdYtNtzALGW4jQKwxnfCBiqbH/LAdyL1V
 BsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cYFXtnPjxkwXVpOEkFeRU1z+NIYCj77IG3IGN52gWZk=;
 b=A5CWZ9vjjLuD50atbAysDRcKRp/UswRnQVk9VDStyLX+LFLx3RACasEQ1kr4JYOMvx
 CAuoU9+B+kIyr34EhxnEZnUlC+bEBm27YEbSVOAF1r+HTlAOT164zDD1R/2E6vw4l9yR
 9eZO31q/jg64+IhjSuvwdzMElW0Eroos7TMAhlAcL8RUGkjIJjaEE+/mBVT83Xxc9L14
 b7LOt6yrqzyaHlkUVlg33CDbayMZO6JmjBOTus0N4DhjyzHLYmopGu3wRbFrHOzXYifm
 cJhOH0kvSCBn/Ma4aMfxhams7KNP7prwhntFxk3d5wpRmnUun9NLgELep4PbON38eynI
 cZXw==
X-Gm-Message-State: APjAAAUjJjFLGeg2sE3e0czruVveLOGMp32UljOASeAyhlxHwBdUObPD
 l0q8Ol+yxhJgBkKpFgpmPALVOA==
X-Google-Smtp-Source: APXvYqy9o2QyyJE3vOmSOd3KYmqe7lvP9rBfw/AFrIhd61JSc2OAkU5ntnUZWFOliw8blns/1INP6w==
X-Received: by 2002:a63:5b54:: with SMTP id l20mr1890800pgm.324.1582691678866; 
 Tue, 25 Feb 2020 20:34:38 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id d69sm789845pfd.72.2020.02.25.20.34.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 20:34:37 -0800 (PST)
Date: Wed, 26 Feb 2020 10:04:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200226043435.m4fkofj5533sd35t@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
 <f1801e95-5200-48ee-a8b9-38e8b90e6593@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1801e95-5200-48ee-a8b9-38e8b90e6593@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 08/10] syscalls/move_mount: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-02-20, 11:34, Yang Xu wrote:
> If using TBROK, it will terminate the program. So how can test the remaining
> test?
> Like move_mount02.c, if test "invalid-from-fd"and fsconfig failed, it will
> exit. So how do you test "invalid-from-path"?
> 
> Also, using return after TBROK is meaningless.

I think one of us has surely misunderstood it all :)

What my understanding says is that if you use tst_brk(), then it
breaks the test and returns early. TBROK or TFAIL, both can be used in
tst_brk() or tst_ret() and they only imply what has failed, the test
or some preparatory thing.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
