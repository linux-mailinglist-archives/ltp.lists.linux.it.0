Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7F22C2F1
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:18:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 979B23C2A92
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:18:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 18A313C18FA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:18:17 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BE68B1A01952
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:18:16 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id p1so4200630pls.4
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=la6Ca4zDv54CT0k1oKflkWZCHuCC5wPkSPjDA0QEB/o=;
 b=zRpzGuYLiqedlzPE/z1fN+MTcTJZqrgURl4GcHXdm7dcWHeqhAXwDhLb7hIxmwNQ/W
 mEXbyXvk+QJvaFCMN17CBit8fiaoLt5ScP6AxwsE4XBMHahEpLnfzK95qO4qz5ulYe8R
 NPNb2DkhKO8ZyGcVCdCrx3wwrAKn5GAqaJEh0YzmA1+3kUVMIjOPL/mZYJtq6yvZVcxZ
 HvllDQlBhWH9AnxzNt31CvEMFhoiUmUFCIt0WIHjg9MWXornuSikfxnfERo2Pv317owQ
 ch8ay17sd1R8Si9RaLJPWOMjd4FNgEXuH+fGleNcs/rM1cLZfYm1sIgn4LjdQDX1M8ET
 pfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=la6Ca4zDv54CT0k1oKflkWZCHuCC5wPkSPjDA0QEB/o=;
 b=MDhLVLfymulkjVAgwydNECRe/33V40/hw6UgVN2soovg8DZR6D8hgtX5d9toNqsSJg
 YFr3knGK1g46y4GOf9i/xOnFriScZYPt75LJWDYq97595ES93NcyKxN+KQklCmzYGEZ7
 Sii+pPyFyJzizGqU4Q0ba578DU1JCMh4lSMEtqarFQ+z64dVQ0GIKjPp+cJJKAt1QGIv
 J3MMU6oGLExG1oa6k4ROUy3mo2TmSGOrdLw3/jc/pMoSKfOuyYU77SOTQfFdDJ895G9c
 fP4Zu6Esvipa7dfp/Mx4AoYA5mEg7OFa+763fjXa1f2wfNW5R77PM3Fjeeot86r1ZRZI
 XwPg==
X-Gm-Message-State: AOAM5320UybuTcEkkG4CXkyJ3mpJz8ejPNpVATdt7nGk3I1rmFP1HP5G
 ycc2u/CZVTVsVTQamuZi2I/v2A==
X-Google-Smtp-Source: ABdhPJzm9boJ6+nW1TVSZlIIRIDIg1Rm2hTT4Zn56InbwJoOYp2ogFOmQD/t21hazUoTPl70RlR4ew==
X-Received: by 2002:a17:902:fe04:: with SMTP id
 g4mr7540278plj.66.1595585892101; 
 Fri, 24 Jul 2020 03:18:12 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id r17sm5881803pfg.62.2020.07.24.03.18.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 03:18:11 -0700 (PDT)
Date: Fri, 24 Jul 2020 15:48:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200724101807.dtf46ydpegj3w43d@vireshk-mac-ubuntu>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
 <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
 <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24-07-20, 13:07, Yang Xu wrote:
> Yes, only _ALARM fails.

Right. So this seems this is rather a kernel issue. And I am not
really sure how to handle these.

Cyril, Any ideas ? Do we even try to support 3.10 here ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
