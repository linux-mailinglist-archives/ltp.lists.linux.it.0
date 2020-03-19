Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C318BB2C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:31:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E05A3C5463
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:31:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4F4AB3C545B
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:31:50 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A416B1401424
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:31:49 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id t16so1202712plr.8
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MwORKVV0w3kdAKKsWfbpA+ryQJmMPVmgfGpJ5Htv06c=;
 b=XYP3XvEAvTtDbyswz3Un71fiIvUlMFXz+6ej4JVpxpAByzosBFenM+DoMCPXZg2PnE
 lGAR/b9lxaZDrRvkgS6iTGRSbFqoT9H/MFtrNop3ob6n3p8K6sVM5HyjWDq9J7HeCA0Y
 jllfjefdHGtIe1kUIc87RAs4hZOvnh+kBuNRZuNZ9qG/X+0TMwH0rCjtZuRRmM/AsR+p
 YKbbyzIbX9olDtHmTwgAcxeDVs6NYEIJiGyLmrFJkD/e1dmnCQDKXK4iBD3w/mjUEmjt
 QbFHfqCDUrgkpEPw3dK9K562oBN5S4FHPlNJQlW8JzYDQ1umTgG0HIaQSnaXJJn4jnJz
 vM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MwORKVV0w3kdAKKsWfbpA+ryQJmMPVmgfGpJ5Htv06c=;
 b=r1dp6hE/cleqXW6xCgxscle43W84D4wcyi8t8KfUKXeJoGIkR+Eaj9Pnu51UE9vS4k
 hBTXyjF4tehMGqfr0EScDrD6+86byvVydfPVIrI9jeTHVtAW7FUnuh+uUYxekgiPSl9z
 txwuu7+JEPV8XogiOZw0/1EfyzNc2kiWlHMdVwkk+Ashz6dYNOx24jaP3ebYh5V2cmBZ
 ANdppUO4muCvjlr/hJLnX9Y5puNdlW/8WRwRc8HZe30kHGs+l9el1tfkocNJXPkETWuf
 61S2xk126r38tSJd+6frPx1n1ZhprVkO5uaR0i/Ki113L/Crp85i83S/3a29Znx4pVnk
 BChw==
X-Gm-Message-State: ANhLgQ10pqKjiuKFdu5VRtBPt8/rtOw46wd46z4VwzKE/E9yj/Bp2LAY
 L4smBfGzTnT9Dm+lKJ9z+xs8vA==
X-Google-Smtp-Source: ADFU+vvzUByj3Z5ZwnTJ+SzTi/4AVqGLueTVJh53lCl1tWFi8Hl8rPo6i3aQrEzOpKg/Cp0lq9+tkw==
X-Received: by 2002:a17:90b:4385:: with SMTP id
 in5mr4311165pjb.87.1584631908122; 
 Thu, 19 Mar 2020 08:31:48 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id g19sm2857745pfh.141.2020.03.19.08.31.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 08:31:47 -0700 (PDT)
Date: Thu, 19 Mar 2020 21:01:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200319153145.rpisoatc3yvtyyaw@vireshk-i7>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
 <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clone3: New tests
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

On 19-03-20, 20:49, Viresh Kumar wrote:
> Lemme start by excepting that I am bad with userspace programming and

                 accepting***

> I mostly do kernel stuff :(



-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
