Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C786FCCF2
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 19:17:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D26F3C1CBB
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 19:17:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1EBBE3C050E
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 19:17:04 +0100 (CET)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D6B5520150A
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 19:17:03 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id e6so7628571wrw.1
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ynC8LyyFvcoVTWEGHwZWnB+Ipu+8c4i+3AtY/3/6+v4=;
 b=dDSdX31/xrEWIS6IGLt4Jrkb1XKHwrntQCLVW5nemZlska19JfWzNZYyB70kI9f6GN
 7FcRHtKA/WomSP7Z24LVwHV3rIq1vPMEY+fZHKXcu7HvbsDF08dWyvbI3LhBRPrxeUui
 E0dx6EN5W+YLhfh+Y29aRey9UFqsTsP/X6dk9NmF96LUy+anXGTHW7BwNi1l6SmBXR8W
 rbRrwoTBo5CqK3PawwZ60ikGiRDnFeKvDvIIhByMW/JtCyc2y9r74SBd9lgj3bk4NMjD
 vW0lu0dtxtYdPVFQypaclbiWphWUfcsbvhR9wbm1WeSnaU2UJ8urWronOPkbUlYxURLO
 Tfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ynC8LyyFvcoVTWEGHwZWnB+Ipu+8c4i+3AtY/3/6+v4=;
 b=MP06uYm538/MZqqMLkDH/0g5QI4lYDMrwv79Kg/UHeJFWh2rHIPyakSP8kFVRcFz9X
 Jpguwf2499SYQNp38XhG0PEL2ut0e0qoLl7c9bQodSUFVfKQZA8nPZ+hvZxZYlCzQ2IL
 jmPbtMDTSjsB016e5NJ23FSTsr5VTFcaGHD2cNcJ1T6PB0nINlRD6Wz2ApgFeLVD+WZc
 xq1gORe6V81QSrnbwDgHQv8MayivxnaW/o6t5tvEg/yZhObsFAzbRHnyku9jQt4C6Eks
 /RRx3t+c4W+ppctaRV1DizW39tB1Hcgqli31jLIqTZoXDW0okO5F4OQT3ynzb6BVmSoZ
 T82g==
X-Gm-Message-State: APjAAAWvNiWBL3f3EGH5PlLhHP2HizaxuVbuSIyXmq5fy5Q5WFeA0Atc
 8zmV7ItlADXTv/5DX6UM69M=
X-Google-Smtp-Source: APXvYqyDPlLW3Hue62S8KfgZKgXWY4KhCrrHQu4zgb0B9O6kZk/XiDgSxqSMXNOcVIVEKP0XaloS+w==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr10488757wrs.388.1573755423533; 
 Thu, 14 Nov 2019 10:17:03 -0800 (PST)
Received: from x230 ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id b66sm7437582wmh.39.2019.11.14.10.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 10:17:02 -0800 (PST)
Date: Thu, 14 Nov 2019 19:17:01 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191114181701.GA27132@x230>
References: <20191113005626.19585-1-petr.vorel@gmail.com>
 <20191113094801.GB31052@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113094801.GB31052@rei>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] fanotify musl fixes
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Jan,

> Hi!
> This version looks good to me as well, acked.

thanks both for your review, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
