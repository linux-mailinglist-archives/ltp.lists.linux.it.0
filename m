Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3508274D6
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jan 2024 17:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1704730639; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=hFU78Wo7VJioxHohe7Zd7cqSsWnkxRAtvNZ/qejF5uU=;
 b=Q+F9YYQRjl+R69AgNYmxYTQ8bDZ88caWz+Yivif8HEtDuHaAklW6Q2WUZWO93yf8/g/Ma
 qMU3wCzXfQZHg7iXONNFRd7fl1xj4bA2G9cP1YYsoW4/6FqYR72KVLJWD6YMacyU2/Va+3N
 3lifIRkGSb+V1prIm04tjX9tYEnofU0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F18A3CFE1F
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jan 2024 17:17:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A59263CBAAF
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 17:17:17 +0100 (CET)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C2B6961A100
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 17:17:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so22422641fa.0
 for <ltp@lists.linux.it>; Mon, 08 Jan 2024 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1704730636; x=1705335436; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2g866SxObT6zsWk71qR2CPkka7nqjjkZsfM/CZgIx+4=;
 b=KSIaCM6khXiJD10LzmehPnTaUVwXqG6gbYzG068TnRgO+NJ9z/sw3hYKDSC2ypO3rb
 Q2RoKApphPoL1pwoBPcwxJbax4lvzg519ZAnpMz7n8X64AziXMbfTrLk5asbRTHI4EGG
 wuesxpVhfNXSIAqrwRHMuXPO7HsG0XrHZ5KRFdg1daQb5De5xQfkpS1KsP8gpvDS/MMJ
 Xk1SrnrH5hOAsyxXre5OL4YGs5EaIkNadSX/jVk9SO8yb8F+dDd68X80kuM4XNMKFQOG
 Au+oBYRokaVIb9vVX1tuRZlXOUP58xSN9XIKAq9mYjBodMnYW4p6JrR1ZMjlWKBWqKaU
 E54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704730636; x=1705335436;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2g866SxObT6zsWk71qR2CPkka7nqjjkZsfM/CZgIx+4=;
 b=tIs8u6kgfNgGQguy80OY4aXdcpQLxuE5rkw/HkgAGxaKDzpALfUmkhW2Qk303AgV1H
 wlvo8dCysmLFsALkq49QH7Mvp4JLcXsuAEw3EELPRJ1caG4RwNYMjXxlWA89XJGE6xfL
 l6HK/wCiW/0Itx/ptIYeXfUTwbLpzw+Nli0PHr9VYWom+5Jls+BWXifbUirrEbkrorZH
 GCRAp23QqpcNEDfmqI/LznKYcZAcn4NQpcw4smldJxfpUwdWHt840+SvLJesipu4x09c
 UDZvV2h0kwDSyjZ1u0i2xN9LGbEj5lGDbUilaVP6FT+ZD7eX2U5w1MkpYczryzurCWW4
 bc6g==
X-Gm-Message-State: AOJu0YwP8F/+TjvWWMTP7k6es19zDbCNZESCTerfElN7VwOUcFyxqbMM
 HAKlqHw8ZorRHcsYKs2hAJ5B2KYg8/GvUAn+QrWweldKc0qryQhH
X-Google-Smtp-Source: AGHT+IHlxoBAG3bEjVTgkywM6JPmXlkGcCHc72Tt+hlKVVgft1E6Uv8PCUIwOYNiIVpuzoBE6/N5wg==
X-Received: by 2002:a2e:850b:0:b0:2cc:f02c:c979 with SMTP id
 j11-20020a2e850b000000b002ccf02cc979mr1646783lji.33.1704730635728; 
 Mon, 08 Jan 2024 08:17:15 -0800 (PST)
Received: from [10.232.133.56] ([88.128.88.100])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a92ccc4000000b003606bd62e3fsm31918ilq.38.2024.01.08.08.17.14
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:17:15 -0800 (PST)
Message-ID: <69d8644a-2237-405a-9ff7-093e94d3cb63@suse.com>
Date: Mon, 8 Jan 2024 17:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ltp@lists.linux.it
References: <ZZQHPkwg-W2R1ejJ@yuki> <20240102210732.GB942817@pevik>
In-Reply-To: <20240102210732.GB942817@pevik>
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Kirk update [was Re: LTP Release preparations]
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

HiPetr,

On 1/2/24 22:07, Petr Vorel wrote:
> Hi Cyril, Andrea,
>
> ...
>> If you have any patches that should be reviewed before the release,
>> please let me know.
> We use kirk c47d3d9311b1b429f385e8d2b35da96dd4330df5 (which is newer than the
> only kirk release v1.1).
>
> Andrea, how about release new kirk version and update it in LTP?
> It could be either current HEAD (bcb2df815d3fdbca470c1ff6ab14ac9cb2f9e3b7) or
> some older commit (there are several fixes).
>
> We should update kirk in LTP before git freeze, to avoid last minute errors.
>
> Kind regards,
> Petr
>
sure I can do that. Let me discuss about some features which have to be 
implemented also.

Best regards,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
