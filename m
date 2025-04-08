Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF7A8138D
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 19:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744133113; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=F3VMrotY/YY0p5vd0D19ItJcF0WW3SYzZ0A/ykymTzQ=;
 b=U3SwFqaumSSjoxqSWTuz2G+pigr+mPAwDFPqV9fa4h/ofmjRfGyOm4Hcurb7cCH1RTHgR
 fe3vQyZJZ+63+glKsS/lZ8V5yl8MAHIuFgG9Yr+iVpn4Nbu5YArBuz3L98nmI2kD3/VbsfA
 Tm2CFirQ0fOkcqwRf1F1Z9lEPKHuv98=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D18F13CB3BA
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 19:25:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 89F2A3CB358
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 19:25:00 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 helo=sea.source.kernel.org; envelope-from=mcgrof@kernel.org;
 receiver=lists.linux.it)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 75A51600C94
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 19:24:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18D5E4A1A4
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 17:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA36C4AF09
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744133095;
 bh=Qn5Ck1vJ06hGQa9KFxXgN+oEMgiIIvvFkdSa9O9bo6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VR/3sGpWJ5rWLSoCgzu87J7ftnRZs66hq5WQ1VtAatTEGudI1q5w90Thdvz5lQvLN
 dxZOMTiVnlgNEVxY+NgiLIvN0gPQA308PFzDRpGgnf3NHsG3BMuaoFh6SU63LutXV5
 08CgQBk4un/8b8A6pubJKz+tPfxAwfIE7VC7ezSAUZ9QZuqOoBuOcz6H7FeLgNS4XO
 zGnCIhMdWCDphR5NFS9pphv1SwbHmZs8Ivc3fu07U/WMUUCjnZKPhZpuMRR0znKmGw
 9DuPj1Ty3cCW+cqmn4PebZf/mSqWg5of2YEMi9t7Z0C2KPtgxKeCwL85FMJ3dpFGzZ
 TW7jLv1H97tHQ==
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so40743875e9.1
 for <ltp@lists.linux.it>; Tue, 08 Apr 2025 10:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrAlSGKjtMNfin0K+cRq5kgKiHKU7ZbNxl7HqSWYBye863uI359/FnfQs++rnpoqliYBg=@lists.linux.it
X-Gm-Message-State: AOJu0Yx9LTlkNuDtnoTr0lAesoBZEd3OSaHaz7/eAKSIeM2wb5Sqd+bp
 t1R1ESpLTfDBTpycSZWOsw3yMDPAGiXhzlzRM6SaInFmLux9gybPfrT5AN/qdG/YNrrFV2A9R4U
 18+CoQCv4HUAlO22/J1R8393u6R0=
X-Google-Smtp-Source: AGHT+IFRAjLfQCBr3rX6vZ2fsBVsMr2T23eGspawcofOM/TZGshy7w4DX7acOT1xhfx/YgNGxx0ILqYbu7TKlmgMCSE=
X-Received: by 2002:a05:600c:4f0e:b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-43ecf9c3224mr136041325e9.25.1744133094266; Tue, 08 Apr 2025
 10:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074541.gK4N_A2Q@linutronix.de>
 <20250408164307.GK6266@frogsfrogsfrogs>
 <Z_VXpD-d8iC57dBc@bombadil.infradead.org>
In-Reply-To: <Z_VXpD-d8iC57dBc@bombadil.infradead.org>
Date: Tue, 8 Apr 2025 10:24:40 -0700
X-Gmail-Original-Message-ID: <CAB=NE6X2QztC4OGnJwxRWdeCVEekLBcnFf7JcgV1pKDn6DqhcA@mail.gmail.com>
X-Gm-Features: ATxdqUG4s7BXjovPaP_VhFNUVZgChGE0cW8x125v6xnSaCbjN2XcbNiVp5avVwc
Message-ID: <CAB=NE6X2QztC4OGnJwxRWdeCVEekLBcnFf7JcgV1pKDn6DqhcA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>, David Bueso <dave@stgolabs.net>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [block/bdev] 3c20917120:
 BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
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
From: Luis Chamberlain via ltp <ltp@lists.linux.it>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, lkp@intel.com, gost.dev@samsung.com,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Pankaj Raghav <p.raghav@samsung.com>, John Garry <john.g.garry@oracle.com>,
 Daniel Gomez <da.gomez@samsung.com>, oe-lkp@lists.linux.dev,
 Hannes Reinecke <hare@suse.de>, ltp@lists.linux.it,
 linux-block@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Tso Ted <tytso@mit.edu>, Oliver Sang <oliver.sang@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBBcHIgOCwgMjAyNSBhdCAxMDowNuKAr0FNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3Jv
ZkBrZXJuZWwub3JnPiB3cm90ZToKPiBGdW4KPiBwdXp6bGUgZm9yIHRoZSBjb21tdW5pdHkgaXMg
ZmlndXJpbmcgb3V0ICp3aHkqIG9oIHdoeSBkaWQgYSBsYXJnZSBmb2xpbwo+IGVuZCB1cCBiZWlu
ZyB1c2VkIG9uIGJ1ZmZlci1oZWFkcyBmb3IgeW91ciB1c2UgY2FzZSAqd2l0aG91dCogYW4gTEJT
Cj4gZGV2aWNlIChsb2dpY2FsIGJsb2NrIHNpemUpIGJlaW5nIHByZXNlbnQsIGFzIEkgYXNzdW1l
IHlvdSBkaWRuJ3QgaGF2ZQo+IG9uZSwgaWUgc2F5IGEgbnZtZSBvciB2aXJ0aW8gYmxvY2sgZGV2
aWNlIHdpdGggbG9naWNhbCBibG9jayBzaXplICA+Cj4gUEFHRV9TSVpFLiBUaGUgYXJlYSBpbiBx
dWVzdGlvbiB3b3VsZCB0cmlnZ2VyIG9uIGZvbGlvIG1pZ3JhdGlvbiAqb25seSoKPiBpZiB5b3Ug
YXJlIG1pZ3JhdGluZyBsYXJnZSBidWZmZXItaGVhZCBmb2xpb3MuIFdlIG9ubHkgY3JlYXRlIHRo
b3NlCgpUbyBiZSBjbGVhciwgbGFyZ2UgZm9saW9zIGZvciBidWZmZXItaGVhZHMuCgo+IGlmCj4g
eW91IGhhdmUgYW4gTEJTIGRldmljZSBhbmQgYXJlIGxldmVyYWdpbmcgdGhlIGJsb2NrIGRldmlj
ZSBjYWNoZSBvciBhCj4gZmlsZXN5c3RlbSB3aXRoIGJ1ZmZlci1oZWFkcyB3aXRoIExCUyAodGhl
eSBkb24ndCBleGlzdCB5ZXQgb3RoZXIgdGhhbgo+IHRoZSBibG9jayBkZXZpY2UgY2FjaGUpLgoK
ICBMdWlzCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
