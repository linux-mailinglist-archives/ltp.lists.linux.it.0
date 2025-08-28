Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D0B39973
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Aug 2025 12:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1756376311; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=UN0opzdTi5WR5/KZoI/hC3fK+APtEAL6W31P2h+g8N8=;
 b=KyVc5fmdNIeeUE2aLKb2NiWN62hTC297YK8K2aTaTSZ7UiSWGNEKJvuV5nphVF6OdVhxM
 Slvh0whf1Yuh6upnuKKHCXIz0XWvG5H/Pl45jnTTxw/+ozZzbf4kF9wwr8wcZtumNwCXWnx
 PTL4H4T8fqro5eP9C+v7x8yne5qkY+M=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D4143C2CC2
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Aug 2025 12:18:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7F983C246E
 for <ltp@lists.linux.it>; Thu, 28 Aug 2025 12:18:18 +0200 (CEST)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3293A60055B
 for <ltp@lists.linux.it>; Thu, 28 Aug 2025 12:18:18 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c79f0a604aso449885f8f.2
 for <ltp@lists.linux.it>; Thu, 28 Aug 2025 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756376297; x=1756981097; darn=lists.linux.it;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygVKFMl6ai1tU1RLLh/58HIG9WO90I8bfVhq53CO1ws=;
 b=Vd/PEngzZozilg8hL2XE4bFM6U3Ju2pJTDuFFpB5NjlbTVkBL8aiWAX/4jmX6OB8Ub
 2DW9VQTuQb3F84nHEjSkB2XypplGDRL4zw71dthcDtWOdvHhGs5VUWD5LzX+EnkJKUGp
 WZfetJ0ylRIqkCkFvLwiHMZECCwdLj9c/ZN2NhiAyrOR+Hb6TYidGyQfc+kgkwc2NUu/
 UnbzFMoaREwvUAWOpXf6nmbBRAopC8MPfMFNsz+3pTj5sH6wob8huzYmLCP+4qnxQV3O
 kzsLdlAGipIzn4BzLU8L7BWeJ5TmmYBUJ6w0DVDCRy3TOi2OmG5NpBon3H/aEgqpszEM
 YLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756376297; x=1756981097;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ygVKFMl6ai1tU1RLLh/58HIG9WO90I8bfVhq53CO1ws=;
 b=u6Ikh4uJWSEn7V1We+Q8DOwtyh/s/Gm8fSzGZ63UiOPdQ4cwzxx9addQPI0CGaQPiq
 NQC9ko9Ess28M92QpCsdpFfnO20q8L4UZDH4CjtBRVzpmNEuWwji4QtRLpsg4WuCuP7+
 vT5WInkZ8p6NyClq7XntlVKrX4+3VUdYnodsxENuVCn5AXR3CysU6hj27+bqkrqLGmys
 HWTRXABg+/SS00AA8oGbZZ/qalBvZmapCtW0NbPaK/r6UQ9qyvYXT6sWiyWT1BNjTCu3
 vRaY0Z9CaNHaz4ooGBYSWfq3wCBizl8xdUNxYuq9JDMme3AAUSh5DT/E0UXaHhsBA9cP
 86sA==
X-Gm-Message-State: AOJu0YwmltZHFj+JWmoViMLHxZToGhJvwptG7KMSqH0ZusNRXVtWvv0L
 Bo8UqQGyv0fuha+7knJ7jSc9T5YEgtRAx4A9mDYC46y3FSU1MtvSXz4IlYcuSEGSv0A=
X-Gm-Gg: ASbGncuQT/gtfCn7w3+Gabtem0Jy+3ozuXfTpebvNYhY39eBSqQCt4vQK7aTATBuZXm
 S3Xw6HmvX10W27dfIajKr5mp4fP/PjmGnK9AljeiXI1c+0Ovc6CHyEkbKCt1gY2AGYhs+4iYLdF
 3N6hf5qaf4FxbBPFArdXKP+wMRFmKkOUABwNdFBd4UZJ2mFeS0+LlwahNeIUH0dIomJamXninX5
 K89mdh1MvsExAD/M4c+v7UEV29lf0elE720I6Md43WuTsNI+a6YPoiCgFnazqCcR8iBkNujhYE6
 31FazHoD8hsT61k1DsbkTBU4jj/PHc/pC+EV0xEMPPz0Hh6ms88CmQDX+jk8uzqLZikXlfaqGYP
 ru0F06aUuVog4AsUEqkQW
X-Google-Smtp-Source: AGHT+IGeg4Fm1q3Ec9R+fjmHAc+HUaio2JqAyM0eh/g3RcOM9sLIzV+Yx1BVbiEN+zyfdbIR3UtvyA==
X-Received: by 2002:a05:6000:248a:b0:3c4:bc55:65e1 with SMTP id
 ffacd0b85a97d-3c5daefc4bcmr16959434f8f.24.1756376297504; 
 Thu, 28 Aug 2025 03:18:17 -0700 (PDT)
Received: from localhost ([177.94.120.255]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ca6240b4e1sm13839066f8f.21.2025.08.28.03.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 03:18:17 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 28 Aug 2025 07:18:10 -0300
Message-Id: <DCDZFL19KNCY.3F6H81H45Y6A1@suse.com>
To: "Li Wang" <liwang@redhat.com>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>
X-Mailer: aerc 0.20.1-125-gabe5bb884bbc-dirty
References: <20250825-conversions-lchown-v3-0-2d261b3de236@suse.com>
 <20250825-conversions-lchown-v3-4-2d261b3de236@suse.com>
 <CAEemH2eAz0kVgxF2dKQ0xzJ1bnD70jkHxijNni8mQvbxGiWrVQ@mail.gmail.com>
In-Reply-To: <CAEemH2eAz0kVgxF2dKQ0xzJ1bnD70jkHxijNni8mQvbxGiWrVQ@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 4/4] syscalls: lchown03: Convert to new API
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
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_via_ltp?= <ltp@lists.linux.it>
Reply-To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed Aug 27, 2025 at 11:00 PM -03, Li Wang wrote:
> Hi Ricardo,
>
> Since all the tests for lchown02/03 check for expected errors that
> lchown(2) fails, is it possible to merge lchown03 into lchown02?

Hi Li, good idea will send v4!

Thanks for reviewing,
-	Ricardo.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
