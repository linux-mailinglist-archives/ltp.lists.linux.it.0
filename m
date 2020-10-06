Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2A2847FF
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Oct 2020 09:59:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B11D13C25BF
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Oct 2020 09:59:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6C8943C14F7
 for <ltp@lists.linux.it>; Tue,  6 Oct 2020 09:59:51 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DA86C600AB0
 for <ltp@lists.linux.it>; Tue,  6 Oct 2020 09:59:50 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id o8so822813pll.4
 for <ltp@lists.linux.it>; Tue, 06 Oct 2020 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ciIo2q+aogFQ6PKbQ5kHG9zjor4qTypsmAuUw/KfP5k=;
 b=GXOKBANmJxXbz6T+ZxsAyIozSU/rRs8jbNKTQGh4E1r++66emVZtb614WUmqgjjiTT
 myUs0qDmFRRslc6CUeXD1cnC/NE90hp35z4jXObIPGLzp7AfgKDLcUH3C9FOG0BpMXdf
 qcw1po84YQMbYNX+VR/rkUfNc1xNwV1AemXsdbCG9N+3yBoFfGluk8S5FHjX6TLjsJLn
 +/Xl8i01cODb2OZs2lsZxMJb+fxVY3AJRBMnEArTAS75VcaknEVVU+ZQQXliMYMaKmgE
 rFp9oeI7vc3nqPOTc5T+BfDfZxSPQrGo9gzL1b6WzMktHNKsWVdeV+tPPGfCgRXFljtB
 080A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ciIo2q+aogFQ6PKbQ5kHG9zjor4qTypsmAuUw/KfP5k=;
 b=YJVUcVO81tjYKtpwtgcu/Yx2KJ2hDBz4FgfWfd4utnc4qsnounX+hypreHRhSl37u5
 5Z6D6ZX1vVEOHapbELkQndp3fHj/zVe5L/FoK+FyMzyHT9SByK1wJcydgwa/121BKIjc
 se/xLOiUCx+FoVIpzaPlvaDaZIpRM3gX5w/MB8Ofl+FByez7ilNCm858eewyXvbouIDW
 MtrVXnaSrPUu4qZLmwlNNKwJZz9OTeLVx3pniLrJOJpO13YwDF3vjsUtFWy+DN39XJyJ
 eyIck8vPu/k2rJ/hfrvpjCCt0VjOEpmiF+zckDX2W0HDE+1H1/KNCQBrWNG8UkDCi3u4
 TJUw==
X-Gm-Message-State: AOAM533R6hdVysqLiO85GU9RUJgnwt+SJaCDJtjNGTTAVBKaiqaiU6lu
 tG4LKfh0jHhTEeNXZqN3knffKQ==
X-Google-Smtp-Source: ABdhPJzlbmucZR8Xx2abITiDmieyWNaUp8z8V5FrO2BFeawTGrGKdL/ttHcry7c9OMQuBGlHY/kJHA==
X-Received: by 2002:a17:902:bc8a:b029:d2:2a0b:f09e with SMTP id
 bb10-20020a170902bc8ab02900d22a0bf09emr2230147plb.33.1601971189189; 
 Tue, 06 Oct 2020 00:59:49 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id e5sm2236093pjd.0.2020.10.06.00.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 00:59:48 -0700 (PDT)
Date: Tue, 6 Oct 2020 13:29:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: chrubis@suse.cz, ltp@lists.linux.it
Message-ID: <20201006075946.cz744zml3fw352zx@vireshk-i7>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 1/3] syscalls: select: Merge few tests and
 migrate to new format
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-09-20, 15:14, Viresh Kumar wrote:
> This merges the first three tests and updates them to new test format.
> 
> Acked-by: Li Wang <liwang@redhat.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3:
> - Improved print message
> - Improved comment at the top

Ping.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
