Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C3C47EF0
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Nov 2025 17:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1762792060; h=resent-from :
 resent-date : resent-message-id : resent-to : mime-version : date :
 message-id : to : references : in-reply-to : subject : list-id :
 list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=8zWe+sfUb0oWud1JZMXIcqins0E4rKlQcMTDxBmtFgM=;
 b=daFDQpWGvRKUhO1JbdHdWZWuA+gM6wqR0tzptlS97hkGTRb2Iy/1C8q2qXqrs9Iy3dRUh
 fHDz19+HCaB6A93ZaWBYqrGIXktDcWgHJsFpNkFiAbtJYsgCtQ1vQhX4yBMpFTsJgipDSAQ
 MOkoZ71FNxlKVMgWogc/kEpRc9wCrdw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B254C3CF5DF
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Nov 2025 17:27:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0B223C9ACB
 for <ltp@lists.linux.it>; Mon, 10 Nov 2025 17:27:37 +0100 (CET)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 392BC200974
 for <ltp@lists.linux.it>; Mon, 10 Nov 2025 17:27:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b3b29153fso781258f8f.3
 for <ltp@lists.linux.it>; Mon, 10 Nov 2025 08:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792056; x=1763396856;
 h=in-reply-to:references:to:subject:message-id:date
 :content-transfer-encoding:mime-version:dkim-signature:delivered-to
 :x-forwarded-for:x-forwarded-to:delivered-to:resent-to
 :resent-message-id:resent-date:resent-from:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmxCaPxNpIFL8rSGqvqlkZKg4TOE3CJfahbim3Cs5xQ=;
 b=iKVVGrETxzg3iODB8blTn1kNkGas02qeYDXJWwwd7DzEMdKvHCPhb9szwSjL8nRs6o
 PZJ7F7k/ihQxD9XpBqO3HrDbHLJj2FXZpHfsDB8azLdFwez9ZDxq0K6JU4K4duigXUhu
 SvR7stoMGLg4o/dHdxXNNgv+hlbcwGCdmstqOG0NcTLX8k4ZCqF4ce9kMdCrArrQP8ZH
 Ieq/cYexNUrpUSZMr7Od5a/Ptx4BsKnSoHR6yOsfhffK91zdWQ7Y4x36RRHSjF9k+vN4
 aiInuWhwkNzp+xzMES3GzQLcyQu5VdO+tduHcdNBja2Jsijo6s2wSoZMfI1TjP2mnF4I
 12hQ==
X-Forwarded-Encrypted: i=3;
 AJvYcCWhHsS9FRXcPpW3AzrbXZ1wqbD6Rjxbej5ks4RVrn7Y54uW/ajJ3v11CPXtMGYFMHpLzFw=@lists.linux.it
X-Gm-Message-State: AOJu0YyQKr0tBmGFcnDL7FibIc4IET9aDi795pzKG2WvHLI6MEF1TEOP
 Zyth1nH+5UvVr/Bi0Jj+4GwPuChhnK1MaPh0oeMimqohvKSD45DtyvpFMVPXrYVg88C3bio8VwS
 AH7oS
X-Gm-Gg: ASbGnctqXpoKJ9oCVkAM4NB/BK96iPac8wywiB5Jxz81T5rkRwkhAvfEtWza210SfAs
 14rjwrLfSBBTnFvnIgVJH4s/uoA1WQ+wuOPvKHA1NWgulj4/gGyunohyag+ojh0atRdxt/dE9CQ
 uN0hGU1V5X5oi8LWZLmkOzXZ866MeHIstvdnWslinlFfShJEawREB/ztdCisvemQqG0o1YRdsBS
 B3wFwaipdXw+7RrXUilQMcr+KTOnRKHHklZbPhjdlB81Cwvf0MOjzsEsDdpsn3YzQaRBay8kUil
 kfcu48EDAwz4+smTMEvMMc/iAEutBXD89dFzlHRnluyCi20rQpE95hfFU3fXJ/5jLOfPVCOhxZe
 KxxS6v4/AygZRpvlPUUbW7fabGSAW5f919KIRspqgETaVBZoktDnQoLI+xZARoye5LnDd4BtdyG
 lPZnHrPY/NDwU4yfQPBK7rANOwaLR7wTY=
X-Google-Smtp-Source: AGHT+IHTwZiR3HT1ZnMvqr6GgXycY4yM4v0TCUQyGC4DB7mZKTX8yVpPY5GTQYZpJiNix2QxzwrfTg==
X-Received: by 2002:a05:6000:2a0b:b0:42b:411b:e487 with SMTP id
 ffacd0b85a97d-42b412b292emr1244424f8f.2.1762792056465; 
 Mon, 10 Nov 2025 08:27:36 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62bfa0sm23844462f8f.5.2025.11.10.08.27.36
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:27:36 -0800 (PST)
X-Google-Original-From: "Andrea Cervesato" <andrea.cervesato@suse.com>
Resent-From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Resent-Date: Mon, 10 Nov 2025 17:27:34 +0100
Resent-Message-ID: <tvysrsfrg2abcm6wxwttylmhaovthviwn4bhtq6g6zcaunueg7@q2vqpsqd7qop>
Resent-To: ltp@lists.linux.it
Delivered-To: mkoutny
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 by imap1.dmz-prg2.suse.org with LMTPS id WOTUILnfDWkSHQAAD6G6ig
 (envelope-from <mkoutny+caf_=mkoutny=suse.cz@suse.com>)
 for <mkoutny>; Fri, 07 Nov 2025 12:02:01 +0000
Received: from smtp-in1.suse.de ([10.150.64.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 by dovecot-director2.suse.de with LMTPS id MFkVILnfDWktUwAAxW7PVg
 (envelope-from <mkoutny+caf_=mkoutny=suse.cz@suse.com>)
 for <mkoutny@imap.suse.de>; Fri, 07 Nov 2025 12:02:01 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by smtp-in1.suse.de (Postfix) with ESMTPS id 4d2yN9226fz1vdX
 for <mkoutny@suse.cz>; Fri,  7 Nov 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp-in1.suse.de;
 dkim=pass header.d=suse.com header.s=google header.b=b8uXQp3y;
 spf=pass (smtp-in1.suse.de: domain of "mkoutny+caf_=mkoutny=suse.cz@suse.com"
 designates 2a00:1450:4864:20::52d as permitted sender)
 smtp.mailfrom="mkoutny+caf_=mkoutny=suse.cz@suse.com"; 
 arc=pass ("google.com:s=arc-20240605:i=2")
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640f0f82da9so1291265a12.1
 for <mkoutny@suse.cz>; Fri, 07 Nov 2025 04:02:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1762516921; cv=pass;
 d=google.com; s=arc-20240605;
 b=j8X2tbfeNvGTvD/K0vnRhS5fbU7BI0p0LzhDNmoFu/URfBsMfXBtP9SNSBWgr3paPy
 dXh5MUPL1Gf5TuydGRdAR0TCbes9Tgx6gAmtZm/3dO27SB6VKq4VKf71u10nxOwCsiob
 O4Ia9cBqQ8ccEKsIfV3bxEFjhibNkjo+2Bqit+rISK9zPoyTRtGS8KYOucagb/TMBu/o
 8KDLDoALzZgksYw2mLCggbp/L9aEYrNUzPXNuxDC0v2SmCAKkSMnQRcxLcRf34Z4/MrP
 lhkwgki9NtFFz3GPTqsKJEub2+S1bhV4ALIz4CuXVXXlPy6s6Q9gDUOiLv/7YKC7WTP+
 nTmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:dkim-signature:delivered-to;
 bh=xmxCaPxNpIFL8rSGqvqlkZKg4TOE3CJfahbim3Cs5xQ=;
 fh=UhvOoCyXPglvz83F9JywA64Tsfj/njsU9MCKBkWreBY=;
 b=ArX/2ZWY8HNViRXKBYaRw2vNNwyO7+ObMp7R4UsWOhJeBeAoYfhKziwuzSG+x274QO
 YUN1QpFz7VeWzLU8P7N50NGYBmTa8JQpPPclDofAfIRzUHCyfEcmpDXfwiZKysPX/HS/
 e2/kBZvgzSleIv8dOsGkge2yEKEnoB74nDr+kHr7RybChD2MdwxRfujiNcfb+Dx16q/j
 9qE9iKaSksDEhmW0BmFpxtdf6a2OLZZUJDDjtYlqEpJnF29bvE4GzqYvOJRxy6ar+qwJ
 KT3VXQVNf6nnw9V6TiSXEBa6xpbNGqU1rRBgO32YN1xJTcsUrh6CAd/YnaL+S4ct7F4Y
 StcA==; darn=suse.cz
ARC-Authentication-Results: i=2; mx.google.com;
 dkim=pass header.i=@suse.com header.s=google header.b=b8uXQp3y;
 spf=pass (google.com: domain of andrea.cervesato@suse.com designates
 209.85.220.41 as permitted sender) smtp.mailfrom=andrea.cervesato@suse.com; 
 dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com;
 dara=neutral header.i=@suse.com
X-Forwarded-Encrypted: i=2;
 AJvYcCWR5gX77QuuZitKCodaF3W1fVZS0p8GZIxHT7wjh2iD5Hxwt/YzC/EfLD9jeuQj5nRuBYCZ73WM@suse.cz
X-Received: by 2002:a05:6402:1e89:b0:640:ceef:7e4d with SMTP id
 4fb4d7f45d1cf-6413f1fc5cbmr2901568a12.32.1762516920354; 
 Fri, 07 Nov 2025 04:02:00 -0800 (PST)
X-Forwarded-To: mkoutny@suse.cz
X-Forwarded-For: mkoutny@suse.com mkoutny@suse.cz
Delivered-To: mkoutny@suse.com
Received: by 2002:a05:7412:2ba2:b0:1a2:d732:fc3c with SMTP id l34csp342400rdc; 
 Fri, 7 Nov 2025 04:01:59 -0800 (PST)
X-Received: by 2002:a17:906:f584:b0:afe:b311:a274 with SMTP id
 a640c23a62f3a-b72c0ad92d0mr247890666b.46.1762516919120; 
 Fri, 07 Nov 2025 04:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1762516919; cv=none;
 d=google.com; s=arc-20240605;
 b=HbT7tS9amar6XZQtbPQq8z3FzN0EnllFaTo+ELx11Tfx47Bnmgh4rfweppLda1fyIa
 xy6lMpsTVM0Xew0aybQuApf0UDjwPARdovAf+AOnlyNrnU24sp/ayB/Hd4h1z1iJ+TeQ
 pU4btP6hiwqEga7xIaAxOtmtUgg3h0v0+Pf3TlbBQPxQyXXf11laXZUcmpiJ68/LzGkN
 Wh6U8ATIJN0EuFdO2JqEYAivKjbIXDnW1Kgxl+G+loIY0+uV4oCVPHd64tGNG5vCCb/c
 4rNcHcikP+IErCBVA73CVV61olWJGeYBQPqCzfpfRBdGuydoISl3p1x1p8NA1AEqFYZD
 rWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:dkim-signature;
 bh=xmxCaPxNpIFL8rSGqvqlkZKg4TOE3CJfahbim3Cs5xQ=;
 fh=uRoKv8LqnQ5eHLr9nVYPVnHj15tOn8byXakfJ6K+OCA=;
 b=OqvZNI/yCYyhMBFY592BPJsGzU8b9uBSfxH71suBVUX8Aq706w88EFobwkOBJte+JL
 8l9QLf2Pp97LwqlsKG/u71xpIEiBV4tLl1nVnXpbSO7ilDI9HziQGA/fkK0UR131L01T
 HP6ZaBicKrYXG9TE/2qxZsxUPdzsYH6NTgvCofXx2LdyyJyaa/OpDsj/zfqLHf8K4fot
 6oGbc42g/Rombl2o+xib5HaQkZd8U6eo0dFs6BynSr9yF+/BzPn/xSN3iJUpLfJ7obqc
 mjsa4qZ5lmWGEU8vwV40d2/zPp91yqdktq20SBT+IWNf88pg49u7EQZP85JXamdPDyXF
 s6UQ==; dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=pass header.i=@suse.com header.s=google header.b=b8uXQp3y;
 spf=pass (google.com: domain of andrea.cervesato@suse.com designates
 209.85.220.41 as permitted sender) smtp.mailfrom=andrea.cervesato@suse.com; 
 dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com;
 dara=neutral header.i=@suse.com
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com.
 [209.85.220.41]) by mx.google.com with SMTPS id
 a640c23a62f3a-b728f14e8b7sor177502166b.14.2025.11.07.04.01.59
 for <mkoutny@suse.com> (Google Transport Security);
 Fri, 07 Nov 2025 04:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.cervesato@suse.com designates
 209.85.220.41 as permitted sender) client-ip=209.85.220.41; 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762516918; x=1763121718; darn=suse.com;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmxCaPxNpIFL8rSGqvqlkZKg4TOE3CJfahbim3Cs5xQ=;
 b=b8uXQp3y8GiK99ZE5fqErRV8YhYw/aohbLt2clQkyHQJIO2WARaebc8BzXdujrRupX
 fLiFZLMZ7WoycsgocCx97uKDd9kdFpKHMfCpHneLCRrKn62NYsc0dbEkrAtf5Xr8dq9I
 gbNw62R1CAELpv/7KGL5r3Th8P141+/x0v0nJbcAGh+FXRYCgSGuCXbCUlOajkVvGtFC
 8etw2GUrIUYjyyplgRPnEvsjNix0ARyqBaRQPeu+M5QbyUf7whrw313ZRUeNKdSLwPY2
 8ekjpyW5TkHiYuJX8ZsIZHrRDYFOeekGd9AzJ6Lef9cIQzhkgv9hjmJnHvK/lNJoPA/j
 AOcQ==
X-Received: by 2002:a17:906:16c5:b0:b72:af1f:af5c with SMTP id
 a640c23a62f3a-b72c0a6e8b5mr249125766b.31.1762516918178; 
 Fri, 07 Nov 2025 04:01:58 -0800 (PST)
Received: from localhost ([2a02:a31b:84a1:b780:5af0:a75d:357e:866e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bdf21sm225451666b.59.2025.11.07.04.01.57
 for <mkoutny@suse.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 04:01:57 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 07 Nov 2025 13:01:56 +0100
Message-Id: <DE2G3PP72PJX.2MJ6J2Y375ATP@suse.com>
To: =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
X-Mailer: aerc 0.21.0
References: <20251106-b4-memcg_stress_rewrite-v2-1-a82b0f3f09ac@suse.com>
 <53jc7u4l3tu3jzwa7bg2cyulj5k4sgnwybf4jjxgsf3s57jnis@zwdhay22gefm>
In-Reply-To: <53jc7u4l3tu3jzwa7bg2cyulj5k4sgnwybf4jjxgsf3s57jnis@zwdhay22gefm>
X-Rspamd-Queue-Id: 4d2yN9226fz1vdX
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.11 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=2];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MV_CASE(0.50)[];
 R_SPF_ALLOW(-0.20)[+ip6:2a00:1450:4000::/36];
 R_DKIM_ALLOW(-0.20)[suse.com:s=google];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FROM_NEQ_ENVFROM(0.10)[andrea.cervesato@suse.com,mkoutny@suse.com];
 MX_GOOD(-0.01)[]; RECEIVED_HELO_LOCALHOST(0.00)[];
 RCVD_COUNT_THREE(0.00)[4]; FROM_HAS_DN(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a00:1450:4864:20::52d:from];
 FORGED_SENDER(0.00)[andrea.cervesato@suse.com,mkoutny@suse.com];
 RCPT_COUNT_ONE(0.00)[1]; RCVD_TLS_LAST(0.00)[];
 DKIM_TRACE(0.00)[suse.com:+];
 TAGGED_FROM(0.00)[caf_=mkoutny=suse.cz];
 FWD_GOOGLE(0.00)[mkoutny@suse.com]; MID_RHS_MATCH_FROM(0.00)[];
 FORGED_SENDER_FORWARDING(0.00)[]; TO_DN_ALL(0.00)[];
 TO_DOM_EQ_FROM_DOM(0.00)[];
 ASN(0.00)[asn:15169, ipnet:2a00:1450::/32, country:US];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a00:1450:4864:20::52d:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, mail-ed1-x52d.google.com:helo,
 mail-ed1-x52d.google.com:rdns, suse.com:email, suse.com:mid, suse.com:dkim]
X-Rspamd-Action: no action
X-Spam-Score: -5.11
X-Spam-Level: 
X-TUID: jKyIZ9pw2A18
X-Spam-Status: No, score=0.2 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] memory: rewrite memcg_stress_test into C API
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
Reply-To: Andrea Cervesato <mkoutny@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTWljaGFsLAoKT24gRnJpIE5vdiA3LCAyMDI1IGF0IDExOjMzIEFNIENFVCwgTWljaGFsIEtv
dXRuw70gd3JvdGU6Cj4gSGkgQW5kcmVhLgo+Cj4gT24gVGh1LCBOb3YgMDYsIDIwMjUgYXQgMDk6
MTY6MDZBTSArMDEwMCwgQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNlLmRl
PiB3cm90ZToKPj4gRnJvbTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNl
LmNvbT4KPj4gCj4+IFRoaXMgdGVzdCB3aWxsIHN0cmVzcyB0aGUgY2dyb3VwIGltcGxlbWVudGF0
aW9uIGJ5IGFsbG9jYXRpbmcgdGhlIHdob2xlCj4+IGZyZWUgc3lzdGVtIG1lbW9yeSBpbnNpZGUg
bXVsdGlwbGUgY29udGFpbmVycywgb25lIHBhZ2UgYXQgdGltZS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4+IC0tLQo+
PiBUaGUgcHJldmlvdXMgdGVzdCB3YXMgYnVnZ3kgYW5kIHVwIHRvIGZhaWx1cmVzLiBUaGlzIG5l
dyBpbXBsZW1lbnRhdGlvbgo+PiBkZWxldGVzIHNoZWxsIHNjcmlwdCBjb2RlIGFuZCB0aGUgQyB1
dGlsaXR5IHVzZWQgYnkgaXQsIG1lcmdpbmcgdGhlIGNvZGUKPj4gaW50byBDIEFQSSBsaWJyYXku
Cj4KPiBJJ20gbm90IHRoYXQgZmFtaWxpYXIgd2l0aCB0aGUgb2xkIHRlc3QsIGl0IHRhbGtzIGFi
b3V0IHN0cmVzc2luZwo+IHNvbWV0aGluZyBidXQgdGhlcmUgYXJlbid0IG1hbnkgYXNzZXJ0aW9u
cyB3aGVyZSBvbmUgY291bGQgY2hlY2sgaXQuIEl0Cj4gbGlrZWx5IHdhbnRlZCB0byBleGhhdXN0
IGFsbCBtZW1vcnkgdW5pZm9ybWx5IGZyb20gbXVsdGlwbGUgY2dyb3VwcywKPiBob3dldmVyLCBJ
J20gbm90IHN1cmUgd2hldGhlciBpdCBjYXB0dXJlcyBzb21ldGhpbmcgcmVhbGlzdGluZyBvcgo+
IHJlYWxpdHkgYXBwcm9hY2hpbmcuCj4KPiBUaGVyZWZvcmUsIEkgbGlrZSBhbGwgdGhlIC9eLS8g
bGluZXMgb2YgeW91ciBwYXRjaCA6LSkKPiBBbmQgSSBhbHNvIGFwcHJlY2lhdGUgdGhhdCB0aGUg
cmV3cml0ZSB3aXRoIHN0YW5kYXJkIHJvdXRpbmVzIHJlc3VsdHMKPiBpbiBvdmVyYWxsIHNob3J0
ZXIgY29kZS4KPgo+IEJ1dCB5b3UgY2hhbmdlZCB0aGlzIGV4aGF1c3Rpb24gYXR0ZW1wdCBieSBz
ZXJpYWxpemluZyB0aGUgcHJvY2Vzc2VzIChpdAo+IHdvdWxkIG9ubHkgdXNlIG1lbV9wZXJfcHJv
YyAvPSBjZ3JvdXBzX251bSBhdCBsaWtlbHkgcGVhaywgbm90IGFsbCBvZgo+IHRoZSBtZW1vcnkg
YmVjYXVzZSBvZiBzZXJpYWxpemF0aW9uIEFGQUlDUykuCgpJIGFncmVlLCBpdCB3YXMgYSBwcm9w
b3NhbCBmcm9tIEN5cmlsLCBidXQgaXQncyB0cnVlIHRoYXQgaXQncyBub3QKYnJpbmdpbmcgbXVj
aCBzdHJlc3MgdG8gdGhlIHN5c3RlbS4gSW5zdGVhZCwgdGhlIHBhcmFsbGVsIGV4ZWN1dGlvbgpt
aWdodCBiZSBtb3JlIGJlbmVmaWNpYWwgaW4gdGhpcyBjYXNlIGFuZCBwZXJoYXBzIGl0IHdvdWxk
IHNwZWVkIHVwIHRoZQp0ZXN0IHF1aXRlIGEgbG90LgoKPiBUaGF0IGludGVudGlvbiBjb3VsZCBi
ZSBleHBsYWluZWQgYmV0dGVyIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPgo+IChXaGVuIEkgdGhp
bmsgYWJvdXQgaXQsIHNvbWUgcmVhbGlzdGljIHNjZW5hcmlvcyB3b3VsZCBiZToKPiBhKSBzdGFy
dGluZyBsb3RzIG9mIGNvbnRhaW5lcnMgaW4gcGFyYWxsZWwgKGFuZCBvYnNlcnZpbmcgbGF0ZW5j
aWVzKQoKSG93IGRvIHlvdSBvYnNlcnZlIGxhdGVuY2llcyBpbiB0aGlzIGNhc2U/Cgo+IGIpIHJ1
bm5pbmcgc2hvcnQtbGl2ZWQgam9icyByZXBlYXRlZGx5IChhbmQgY2hlY2tpbmcgdGhhdCBpdCBj
YW4gcnVuCj4gICAgaW5kZWZpbml0ZWx5L3N1ZmZpY2llbnRseSBsb25nIHcvb3V0IGFjY3VtdWxh
dGlvbiBvZiBhbnkgcmVzaWR1YWxzKQoKSSBndWVzcyB5b3UgbWVhbiB0byByZXBlYXQgdGhlIHBh
cmFsbGVsIGFsbG9jYXRpb24gbXVsdGlwbGUgdGltZXMgZm9yIGEKY2VydGFpbiBhbW91bnQgb2Yg
c2Vjb25kcy9taW51dGVzLCByaWdodD8KCj4gVGhhdCdkIHN1cmVseSBkZXNlcnZlIGEgc2VwYXJh
dGUgY29tbWl0IGZyb20gdGhlIG1lcmUgcmV3cml0ZS4KPiBBdCBpdCBiZWNvbWVzIG1vcmUgb2Yg
YSBwZXJmb3JtYW5jZSB0ZXN0IHJhdGhlciB0aGFuIGJpbmFyeS9kaXNjcmV0ZQo+IHZlcmlmaWNh
dGlvbiBvZiBiZWhhdmlvci4pCj4KPiBUaGFua3MgYW5kIEhUSCwKPiBNaWNoYWwKClRoYW5rcywK
LS0gCkFuZHJlYSBDZXJ2ZXNhdG8KU1VTRSBRRSBBdXRvbWF0aW9uIEVuZ2luZWVyIExpbnV4CmFu
ZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
