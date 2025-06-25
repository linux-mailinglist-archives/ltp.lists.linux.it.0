Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A004FAE7921
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jun 2025 09:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1750838119; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=XAHy0MN+vv7FsxexxkQ5anAT6gJ3upRYkqcw+Hee2mw=;
 b=YEUQunxU9UOErRzK9OvCWdT02ktT2ETcJXqZdVCFql8qS1/4FpsEr6b/gli0wpcvN1IX6
 aekYIOoqD4w9HI2WEG/BFJ2dmeQAiKUO1OTVK+fV/qEpf4pEpgy1udCW4bohw+OKIIBIMqn
 RcjyPxrMwqnpuRYQ/22DPwWxzsqGxQo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC0AA3CCB06
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jun 2025 09:55:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 094873CC832
 for <ltp@lists.linux.it>; Wed, 25 Jun 2025 09:55:05 +0200 (CEST)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 54E1D10007E3
 for <ltp@lists.linux.it>; Wed, 25 Jun 2025 09:55:05 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3732378f8f.1
 for <ltp@lists.linux.it>; Wed, 25 Jun 2025 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750838105; x=1751442905; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k1+b2p/G6HMwDoClF2VHiHLNz6MEYlbVu6TNrlbWPBQ=;
 b=fQH/Og1/aMNVfVxfU524rebTu41gvNyWT22uS9fCPKcKFsjJV2nFtqX61OCXW39Srb
 giVNBYLV0qz2A0/wmwf4z/oucYLb2sw5HNuesIvkMSFf+jHCVhD1MP4nXPqzb4SROQKS
 /hzqzJhVg+cawf9w4Er2pn1kghU7pNXdNCWrQdcjgFAU53tgzPwP4zUOi6ux5ZxEztaQ
 9rQlHHeaXN3vlcITUsoCyksZhlkzLx/xztP1NlXPDYOvpUXm2qqXTqrup6BPmNJNfEI2
 p1y/caAQok5NmTmvWr4zoz1rSKUx7fBZZWzwippV2fbESwZ8tSUfdTnuj8AU+mB/TWWH
 FxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750838105; x=1751442905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1+b2p/G6HMwDoClF2VHiHLNz6MEYlbVu6TNrlbWPBQ=;
 b=Nh7CD2DROTVLg7kjpap89VrciL41eH60pWmy5DQt5umccZIQgzbZCk0s9vHI1Rxrrj
 SyF6rm81OZ+DIdAmpjmlmReNxOZaix+Qvqir1iXuCcLe2eHEfCnmF10ud+MEX94UArmr
 zartd4yUaYHWiIeU1uJVR5HDwtdGwPk2G9bTy1U1p43t1iysutTVhm/JdHnLENUIEntm
 SsQEwY/f2iprh7T2DyyurFIPqk8cMLpaNEN5Y52c2HN9ar1+qu8L92PEaIxksuxQmlZr
 vH1KuD8lh5xa0rShnKoLtNOYAcR+moeeCjmNcHfHaIR5D/yDTKYm1Rc7j8Kqzpa0ymoi
 FIiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNFOpEctjbzAQJto8Zkjv7vqHNijfgY6AkCdJTtk4VFGAc0mTuOsaWcvS1L6VIHWZ/sA=@lists.linux.it
X-Gm-Message-State: AOJu0YwTtmzmFw/QGLwZsJbxfjFJitrOQKjNREC8am6/21Bz0pel4LAn
 jXs0udTvn5u6Yo8c6tMmQXLjPQlqQQETiLJZEzkWxspf66dulEmmlPeaTBOod//7Vc9pPx+qAZr
 pFUXjOdA=
X-Gm-Gg: ASbGncuJ10IuavQsIBHx/y0N8K1hYw0u3sRmnqRvdsm8g/bdoXyzmM2EtELE+POdd04
 7LPFglbn25DxjFdUDDsQBKuw6okO9vNxmWZGnIQyOXBEQvPgjl1zpSn5lx5ElPwthEFRrnLqVPh
 tfMFa5nezP4mpluBHS7Ic9NlwO+Az4+k7bitA6Wp+EiUV1qtbb1bMaHX7QtWiQA8eGgGp6FMZOL
 kb8WuSX3+Eqd2ABro31wTQTGEkLj+zf6dqnwqwaz3K2c6Vnd+Ssey4BSYKcke07m6RJnKr8UqhA
 HVZNhTXv59Ki2RyOOpihMAYhHJbMvCv9rmz6f8ip2lM0xd85V+eBVAQSc3WwTbPDznS9VDVdESN
 O03fyU3ASuh3SFR+OSBq7mr+hLHeCu+ww8nOywCh2P0tCMlu2VzGDj0WgYrHJ9G8MR1FNnkhm7P
 Ynh+OjxwAwVfkn+w9vBcrmJvXueA==
X-Google-Smtp-Source: AGHT+IEWMmxJ4UWLEdrTIHuUFZ9lQ2F7JVwhydMQhONHeRAxrvNNlRwIsHDzsYPQdBgZQGlYBki0fw==
X-Received: by 2002:a05:6000:4b02:b0:3a4:dfc2:bb60 with SMTP id
 ffacd0b85a97d-3a6ed61ad84mr1099923f8f.26.1750838104646; 
 Wed, 25 Jun 2025 00:55:04 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f2e:9a00:8d36:debd:d407:5caf?
 (p200300ef2f2e9a008d36debdd4075caf.dip0.t-ipconnect.de.
 [2003:ef:2f2e:9a00:8d36:debd:d407:5caf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810a9bbsm3825045f8f.86.2025.06.25.00.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 00:55:04 -0700 (PDT)
Message-ID: <e62191c8-eaf9-4cee-92a8-2ebf52613e42@suse.com>
Date: Wed, 25 Jun 2025 09:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
References: <20250624151918.32145-1-mdoucha@suse.cz>
Content-Language: en-US
In-Reply-To: <20250624151918.32145-1-mdoucha@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/3] open13: Convert to new API
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
