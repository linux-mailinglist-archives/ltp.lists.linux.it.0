Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F218C614
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 04:50:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EABB13C54A2
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 04:50:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E2BA13C0796
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 04:50:18 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DF6961A00A3A
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 04:50:17 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id i13so2552052pfe.3
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o3LvB/utOaFEA0CEZ4okW2BNPZQy5IXj73Vhn1oMnwY=;
 b=YxaWxIXRp2jmwAtZdBhVMhRbOcRNdQt9BdnsYEYaoZmfeBc+OZFRIc8KTZutw60v/4
 0N28js4ua73ax6LEqPRtSTBpA1LOeJOl89MqmH96yhYmo5n4veWHpdZor0lRRreMfgBI
 1ylskKhRFxSznrx0apkBKViTjuXvKQQsYUvgiC4qIKTCVkZhQIdFHpKMRD9mPb/cO8Uo
 8JlP3w2bU0gBQRGzD9MjvH6WmNZHFcwa9gS01XL48IxD9yWw8QEh1hPcjyM7E6V4ByYg
 DBpt75uy0sGbGjeX5A8iSJLezdt17ErOxfV4+QgdO1ZX8ZT9zTbN9Jyae3V6YlN0HqjV
 8HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o3LvB/utOaFEA0CEZ4okW2BNPZQy5IXj73Vhn1oMnwY=;
 b=SdI5SSGxFlptNdpo1DJpIq2ENA1b5fgezCUpB7dtxKshGkw6QRZXc0h3y7/TcRR3F/
 TsD+uWoMjOIwSk3cLuHtwS6lKdRE+mTZZgmTHuJPPssibUJgwAeB0D9LrtQn6vYf76xY
 4Yhvy3a804HXUMWAyPD5kvTQYvpYw5P75iIscwN+UIwlLf/HJ90xOMGrx+EL7Mgbok4o
 p/aSR5GPZ6KIzXXahxz2OKTqDwxKfi9SCtWqB039jvo/yk1sNV9mEumt8kpPJk1OfUxd
 Q+ZAhVs5CvIyfvU7l/hDT9rrZ4SkYREUwan8jQywqDUs9UwS3kjJmQEDblnuow88sUjM
 4Y+w==
X-Gm-Message-State: ANhLgQ38AVnymY2UNSb6oX7KI/a37g1WpTJmTalj6Cy9BSQoYOgbADwq
 j7j6aknk1czvhBh6H2UYWJOlzw==
X-Google-Smtp-Source: ADFU+vtD2yNAYXcA+vPe4lvCXndZxhg94PUORYR8awcjAA7bXNFkD33dJM1kmd96DPfTaxOcwUjC+A==
X-Received: by 2002:a65:5846:: with SMTP id s6mr6632586pgr.179.1584676216102; 
 Thu, 19 Mar 2020 20:50:16 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id w15sm3761255pfj.28.2020.03.19.20.50.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 20:50:15 -0700 (PDT)
Date: Fri, 20 Mar 2020 09:20:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200320035013.ythsl7zmj5vtrhyc@vireshk-i7>
References: <20200319174758.20532-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319174758.20532-1-pvorel@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED][PATCH 1/1] syscalls: Use TTERRNO after TEST()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-03-20, 18:47, Petr Vorel wrote:
> Fixed commits in new mount API tests
> https://patchwork.ozlabs.org/project/ltp/list/?series=163944&state=*
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

I was planning to do this after the clone3() thing :)

Thanks for getting this done though.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
