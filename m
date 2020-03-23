Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C601018EE5A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:14:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 634A33C4F29
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:14:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 903F13C0431
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:14:53 +0100 (CET)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F8CF600B70
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:14:53 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id hg10so5509871pjb.1
 for <ltp@lists.linux.it>; Sun, 22 Mar 2020 20:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PcnlYd7HNewjTxAeRZOXfGkVZlEwMYs75MTApcQXCD8=;
 b=eufK18k9lJegd6a7YwBfhbV8YWfL6YlfKbJL6o8QAP45fVHywxdUuyGfuaWlSJHO3Q
 ldhSwRq33Yom9tpB3UyCbOuHcmK0dqV+qUJ0iAIkavAFaXlcfIjD9nGjaFjXXuIIATVp
 gXRyGPkN+xlItrhHBd0x5KMnkBxCLsgSWqe0E1J4ls4R5D3h/WkJUIhgYoFTp+TvFdqs
 rGDTK/qCcOLjR2GBQP2rbGrt2QfFsmd17s6xGMArMihLd6Gb0N7iZWWO274umFc83e+x
 UxcVLYY1bjCpCtPD8kpbnQ4DNAXrstfDy96AozwVT1kY8Ki/nod/hQRm5CzmhDF/BibH
 0DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PcnlYd7HNewjTxAeRZOXfGkVZlEwMYs75MTApcQXCD8=;
 b=M9Bunw7USCWLWzTstSgqWTw1YOizjuWQtucxidEqEoAnGZIOoBLtV70y7zp/7Ir1U0
 49VwXCpU7EaOlkmiQ/rXB5gm8VrRrc5HGYUyw/aCDYU09v4KxUgOyrT8bcilNHUKPkrg
 rZH7QLNTR0PXUqzBotIl7L9XyedIpwgPEn0AgnRsTkKvOtxN5V6DbjFxZsucTdI9xErJ
 uMtjaSdN4jx/kCXay0zYt1uiYzaob/TQnP1O+TvlCTc8h+MMV9YQksJCL+EMRWQO5RBs
 IDcWfcIQglbKqsYMVKeGlVd50fZGmWqranOd/CFckHCwxwbri1/7wJK5O1Jv3RiF3Ywu
 xzCw==
X-Gm-Message-State: ANhLgQ0+Ir7TbBYSTiYSL5VqJKi+D//Sk5Oqh7/lXmVxjJUx1TYAqDQr
 lzPr9++kNQM2+LKL4bKGK5cYZA==
X-Google-Smtp-Source: ADFU+vu7kWgnd2h/70l6YeWmQTimhBG3blp2Dd0Gb7QJ8xu+3AsJf5tybIrTj1Cjx5IdQ0I4D3NOlA==
X-Received: by 2002:a17:902:7c86:: with SMTP id
 y6mr7292350pll.49.1584933291599; 
 Sun, 22 Mar 2020 20:14:51 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id f22sm7183302pgl.20.2020.03.22.20.14.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Mar 2020 20:14:50 -0700 (PDT)
Date: Mon, 23 Mar 2020 08:44:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200323031440.lfqovmbecidd6u7a@vireshk-i7>
References: <b392569b582f264927f2fea65bf14a89c03faaa5.1584679961.git.viresh.kumar@linaro.org>
 <20200320120429.GA31021@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320120429.GA31021@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fspick: Call fsconfig with
 FSCONFIG_CMD_RECONFIGURE
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

On 20-03-20, 13:04, Petr Vorel wrote:
> Hi Viresh,
> 
> > Make sure mountpoint is reconfigured after all the recent changes by
> > calling fsconfig() with FSCONFIG_CMD_RECONFIGURE.
> 
> Thanks, merged.
> 
> BTW how about print flag on failure? (just to improve readability, although
> there are line numbers so not required).

Yeah, I have been relying on line numbers mostly for this. Though I
can add more descriptive messages if you want :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
