Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D629575F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 06:54:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02A473C3193
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 06:54:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 19B863C25E8
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 06:54:13 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF9E8600B62
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 06:54:12 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id k8so291620pjd.0
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BpQ/Swl+zVahzfgX6DoI0b40GSEpbWQ3wYRTw8cZ9YQ=;
 b=UuJEW7f9jdimnJoM6nvzXj5tdKBzIEyjlVDtJTx5ul0Q+u7/9gR/NGaEA72N2C0c1w
 OTotmaCCBeG2z9XHKoW2kxzi4EexzimIYqbCmeRr3bTCQ9laqI+ubecfeSyBSK3RBA9o
 bpON0Yp9qMACJ+rpCHOIuMtDgx52qkCBOCUSZDergV/Gi4wHD71WN6AgPAANZQIyomZq
 7qw+fjlebtbwKfh8TtH2k3ko3i1/RqgPE51xP0eKWyfJPNtd2y72iY5ni8r4P48AYPVQ
 +YCrbn+O97SO23q92Wf9v9hEhzgwK2en0jLbO6z0dMD5CTC0SuVYEdeKYjaODxkI28AL
 jQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BpQ/Swl+zVahzfgX6DoI0b40GSEpbWQ3wYRTw8cZ9YQ=;
 b=Q648La8Q4jx79sULxnqHkwLoGURWucfJzlFJQuaYAKyMIMZ3+DkeBMCxe+sXinRhxt
 Eo22yGWGPr+GM5imCAD1gCJawSli8xdwaUfIvq3papY59j+zqQGf1/nuL+VGBuPEkU7X
 7SPB4FITGYN29dzvdbTywvkDZYul5GzQ4z+LZ3wmQ7CHTbxvKjLV7MSVgnurPnJ7r8DK
 wmnqznlulg92N/SG4TyQePjeW0MekKbAm0VcmR1jqautTaDtlkl+FlpF/P2rXRjGecfb
 bbYytwGMpz5GtBw9wxhIhGwcBdX7dJ80k234yqpxHgiA7WbRBrStTiBFa0zpSq3VpeT6
 mEWg==
X-Gm-Message-State: AOAM533jP0NWVxYikqthRDfCb+ro7W8LuEnpyt3wJtNMLhB1vg1Z0f/Q
 g/f3MLVTWNL8WSImLgXet4JpXw==
X-Google-Smtp-Source: ABdhPJxnIxSR9xmL2on42gnrlUgww0+2E5YBiHJD7LWrFRlRoNkBpmC3tjx9+r0ZYnxVglLGgcJwQg==
X-Received: by 2002:a17:902:ed09:b029:d3:cbc3:8da8 with SMTP id
 b9-20020a170902ed09b02900d3cbc38da8mr961363pld.33.1603342451038; 
 Wed, 21 Oct 2020 21:54:11 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id d7sm512262pgh.17.2020.10.21.21.54.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 21:54:10 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:24:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201022045406.4m6pgqfmwvyx7mh2@vireshk-i7>
References: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
 <63646c1ba9e1a3061b44be4f1f9a29d9d6d03f2e.1603254560.git.viresh.kumar@linaro.org>
 <20201021120434.GB10861@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021120434.GB10861@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 2/3] syscalls: select: Verify that data is
 available to read
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

On 21-10-20, 14:04, Cyril Hrubis wrote:
> I guess that we still need a test where select would clear the bits from
> fd->set though, I supposes that the easiest solution would be to add
> select04.c for that...

I am not sure how to do that and why would that matter ? :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
