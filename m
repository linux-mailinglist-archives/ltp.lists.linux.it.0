Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 686EFA9EE69
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Apr 2025 12:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1745837617; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=QAAD26nvu6y3FPe4SeEfn19LslYTbc2up8PUFcvaz/o=;
 b=bM2WxCpKCoBaTMibDqRQ4tEvb9B8k3t1DGpHA8HhxX0kjfPhBFlk7bTUjiyz8iYy2aICO
 Um45Xqg93yQFxiZpC7kz9bZ6LHT6cm72ZbIYdEKGGPxHW2AXdf44VuZhP/og6P9/+IPRSKs
 5xz70K5/0A0ZvnfOo4WkMZ8xVJ/KGjU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 182C43CBA60
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Apr 2025 12:53:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D88AE3C2F88
 for <ltp@lists.linux.it>; Mon, 28 Apr 2025 12:53:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 07AA76008D6
 for <ltp@lists.linux.it>; Mon, 28 Apr 2025 12:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745837611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qyzKH7T4a3R1GkNuvIhG6366aoDtNrpV0kHqPexFUr0=;
 b=C8IGxjhJkYrbCrMf/aTiT1vzFekUmDh3OlWmR5aPrdbmTC75pln9vgdW+WSrRtjvkDNffv
 gLPrItKngxsjy+g97rz+gbVnU2QvusJTntD+EuAllmgaJepsSuaypTZXwYnpTOE/wCaoUt
 yjlkIesjTFcT2KyfAZALEyJT2ymvcZ0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-alwobOaFO2uHLFWfF3yBIg-1; Mon, 28 Apr 2025 06:53:30 -0400
X-MC-Unique: alwobOaFO2uHLFWfF3yBIg-1
X-Mimecast-MFC-AGG-ID: alwobOaFO2uHLFWfF3yBIg_1745837609
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2262051205aso33435975ad.3
 for <ltp@lists.linux.it>; Mon, 28 Apr 2025 03:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745837609; x=1746442409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qyzKH7T4a3R1GkNuvIhG6366aoDtNrpV0kHqPexFUr0=;
 b=jNvDQQmxTnKFnfxWIwj9ijxngpW97ZiqlAClYDCCx6AeT3Tyv8PzltMF71wS++vN9t
 fcNAUzYW5564VY4PBT45Cchj8+SDf45ZePscq6d0Ji7sF2ysFkaCNI1nkhi0yZKjBJ5u
 S84Wt1Tk/LVy3uxRdOdaG3K4s0P8bjVhZgx4U8qMWrgA7BpxNb6YhyDnmOiwIY9keKrb
 scyq/0OavTGRXn6WMVffracAl9P7Lv/lcmM2LlCtFtJ1T/L6Ab8rYsVmugKmGSZZbgce
 5GnxypTc148ca6fv4/xsi+jZbfQVk0jZOgupxjkK8TTrV1mnkwoWzzkAMMs4UD1Ou5HK
 kLJw==
X-Gm-Message-State: AOJu0YxeYvMSndfNbvGhEew1Co46Gcr0EH3Y8068R1fGAgWJjTDGM6k/
 CfTA0IiaQHudi4QyIr7WEqjBInQJSuQOYyzaLqGJDwzvO6bKE1SU1A0xUIsnQ4jzt617hioo+5s
 LGhv4cFBLR2lRdRuVDwUYdpqu5bzm8cLccPxwky8RoUWnqf6rmzFJYRjvkVa5VWrbyKP2b7n1GJ
 QDHRX7Sl1PvsPZhv4ctsL1WuQ=
X-Gm-Gg: ASbGncuAVr4t+6ZvCgMRev0v8+mz9krJoVLZ+q0Usnfa7ZF5por6tjgvK1lzmeNdnvb
 R9gomjrAoxL2BZa+51cB2fRuC0q+qQ+iSmbcvFOjEzs0+c5HSRJR9rk8179Nw/zRahsq8lg==
X-Received: by 2002:a17:903:138a:b0:223:5e56:a1ce with SMTP id
 d9443c01a7336-22dbf62c4bcmr169976525ad.32.1745837608966; 
 Mon, 28 Apr 2025 03:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd28tgHKYqHQlNW2px52iFMJyyIgM2vSk6pATvZiVnK3zfNG573E5mCm8XQDXFvUp07J3hGS2PCVPZ8wkuof4=
X-Received: by 2002:a17:903:138a:b0:223:5e56:a1ce with SMTP id
 d9443c01a7336-22dbf62c4bcmr169976335ad.32.1745837608663; Mon, 28 Apr 2025
 03:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250425153046.63853-1-pvorel@suse.cz>
In-Reply-To: <20250425153046.63853-1-pvorel@suse.cz>
Date: Mon, 28 Apr 2025 18:53:17 +0800
X-Gm-Features: ATxdqUGu5Fu1cNauph7q4_U7xZfInoekUadUq342ys9kIGz7eEiRy1KpEh3gu9s
Message-ID: <CAEemH2dB9YU4kwgbm4O09FTmVpiy7CFtJaomfdGPVmnqf0Pepw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y5IQpVxKe-3qaySPfxGxkIzvqE7UanjWRV18WU0yX8s_1745837609
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 0/4] Workaround broken openSUSE repositories
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For series:
Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
