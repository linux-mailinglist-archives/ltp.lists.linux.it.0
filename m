Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA31A49919
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2025 13:23:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65D333C9E47
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2025 13:23:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 06A3B3C9DF2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2025 13:23:01 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D9C18142CE27
 for <ltp@lists.linux.it>; Fri, 28 Feb 2025 13:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740745378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVCbzA9Qfi/sIgI5p+0JIByteXdXjlWsKlikHvbpwog=;
 b=F9tJytVN5jd8ESBcbx3jXdXuNFlOCRL5vK0n5VjSjox3PXKEbamXoeLrte0ex69bqBUvQb
 59SfJuV89bSeQGPdbRvYzRC+hHmXVDZ4fPBT/5cxKzdLbX/gTreoml8+k52qqtdfe3jpvT
 oE5kpTtj26hFcsiBm6jQM9LlI1vm73Y=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-tZH-1xkWOAm5u4AS29Egcw-1; Fri, 28 Feb 2025 07:22:56 -0500
X-MC-Unique: tZH-1xkWOAm5u4AS29Egcw-1
X-Mimecast-MFC-AGG-ID: tZH-1xkWOAm5u4AS29Egcw_1740745376
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-86b47d5b544so314946241.2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2025 04:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740745376; x=1741350176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZVCbzA9Qfi/sIgI5p+0JIByteXdXjlWsKlikHvbpwog=;
 b=HJhso38HgRGdWRSdstBJTGRpPTe8OqtcL9Qvpp21ohbnUI3Y42HZo6VMkUC6srqtEt
 skoaJiMMWOpaLfKnBXkCpf8Y/gG3/tXYJZBH140QA6AEGBskdipggdk0fFauN2laUx9U
 yadD8MhoxeK+vm6LCIuFzCWU4mUgPsJN+LBgDl4R+Wvg6l5isD/eCTZhlzhlwtEaGx1h
 3VGxlKis7hgJSk61jFmWbHFzXPoAqxcJK6eRLMZVPkPZYbbfaU9WV6U/VK8LP2U0kckV
 mWVxN1gfzv1PG29nwvVfDulDrmzE5eE8AXfZmWY8TqlfHA24hslbsTf8jOcSaO4gfcFi
 w+MA==
X-Gm-Message-State: AOJu0Yya/rE6QoYVmZpEU9Ozb80lBRv7zg9opBeYtBo19zpbdg9IBbkC
 tyk6BTKlJXNmpktoqvhB8qxCJyhH6mmQHjoIPLymqxhK/q/nL1Ey8T4aq0zCaWH+q9YrI3ZF8XT
 ns1z5rANXKFn/9MgHqAjlX2ExPf48BzBqog+oYX1/ODnPaVl7/N5joQ+Q60lPsHyrq7ptC0x11Z
 trCKyePOhRHXWa+4im87h3QFg=
X-Gm-Gg: ASbGncv2XgrFJnbldG+d2nIDbG8EpQDbo7U4eWyv9FNZyk56yLKJowjGX+mioSVfiIZ
 0Fvs01+3pqMhiR5AvS8A6Sc4RG66pH0AMozqwe0F8CjSoio0UU+YXSjrSkDMta1AUL7JUyv7z
X-Received: by 2002:a05:6102:570b:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4c044d30f60mr2193598137.21.1740745375948; 
 Fri, 28 Feb 2025 04:22:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxnIsGqocPmlRB0HHOBlJpJ2ci46g8KenxvDyJ7jMDsM5P/o7sZN/LQOl8iAFgIxT/tLZ7jxaePyPFGUmNG7E=
X-Received: by 2002:a05:6102:570b:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4c044d30f60mr2193594137.21.1740745375737; Fri, 28 Feb 2025
 04:22:55 -0800 (PST)
MIME-Version: 1.0
References: <Z7yTEEf-BR3qnpz9@yuki.lan>
 <76a95636d3519b759cca00fc6883957f9b8e50ef.1740482145.git.jstancek@redhat.com>
 <Z73DNdDCdDD3rh3g@yuki.lan>
In-Reply-To: <Z73DNdDCdDD3rh3g@yuki.lan>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 28 Feb 2025 13:22:40 +0100
X-Gm-Features: AQ5f1JphqJANOMCfsxLyODI2iwT7mehu_vIu_b_lrTAE5wROpqAmDZrMErGtYuY
Message-ID: <CAASaF6wOkfqCCLnKpc5LQKhFFt6ktJZwfssT7DegQE5Mi5gbLg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SgDY-hrHdipoKd6KSwbq65bxxfntvDi1_9zmxkSfYAk_1740745376
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] provide separate functions for getting start
 and end fs timestamps
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgMjoxOOKAr1BNIEN5cmlsIEhydWJpcyA8Y2hydWJpc0Bz
dXNlLmN6PiB3cm90ZToKPgo+IEhpIQo+IE5vdyBpdCBsb29rcyBnb29kIDotKQo+Cj4gUmV2aWV3
ZWQtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PgoKUHVzaGVkLgoKVGhhbmtzLApK
YW4KCj4KPiAtLQo+IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3VzZS5jego+CgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
