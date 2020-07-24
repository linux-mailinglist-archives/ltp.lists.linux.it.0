Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CC22C330
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:35:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2763C3C2A92
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:35:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 999D53C1CB6
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:35:00 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AD3D01A0149E
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:34:59 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id b9so4217070plx.6
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=CWnEKtS9qzOJwKIdod0o2/KjiGZbCLWc42QxZXSJ1Yk=;
 b=t4frpmoPuwoGe0JNFuDtVhwJ3BE4ZCQZTV6nOOE9vjVXRNlrZ3ncajbMsbx7mtbzO8
 0sYxchLhTjMa3wcG98wIXgIAnvQy+aeFSGtnVWHNAx8NA5syVc+HUWDWuB3STSJl1wYw
 Zi456z8gfBaTO5/pr6u22f28y0qMRFdXa97XQCAbwCKdSrqwMhhQsjbqOXU7knzUab6z
 k7o9SWbeyjjCDPNbCYCb/MzwXZwun1A1BfbvkbMt+dRL85J+fCp+gF0RO9VoUVt6XZMt
 rWwM1uLr7/k3lDRqNMZ1+gl47/33N0PIjAjYjbhnnA0hW3yN1zWnq/anIOqt5jOxxLdC
 80kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CWnEKtS9qzOJwKIdod0o2/KjiGZbCLWc42QxZXSJ1Yk=;
 b=Ts+pCrXHUucwdmuME5SKdNFALFrrPtr+0yzIv3/BbLNlLZuaB8YNjahscuvtar59Vt
 fnVV64EwRwN360Itx3AdZ4abmgLZ9dVU3BqsV1YzoczFga1XCZL3lgnXLR/IJkdidYof
 5+smpChlpQ/ddgjQP1tEyi5t+xTUlMcRp1oNcjtt3DH4NkdanojwFVL5fm2Dd/LGKEq6
 LSUbGJRDaQx8JqLBz8r6xrBY2u2dwjsIzohzw+WZcxGwJ7Jt4F0r2FBxyl05lvbkJP2B
 JR54BVH3WrY4wFMnVBzAKIQYfzFnyBhy5O+AboNovWiFHZu8aAJsg42y+zsvkLyZISqu
 a93w==
X-Gm-Message-State: AOAM5302GlHms5+Ok70Eyc+t5fgIY0SL08XVkNcK+1D+nLzfALxVk2W7
 9x1wveqUIG1riLR4yFLLkxMFbQ==
X-Google-Smtp-Source: ABdhPJyamaJ8jxSOsAcgHH0amAlGozIJ3hAzSnvgBfYkU0fCp5HMXV8+NYdvHE2tRXF63/uzQbXDlg==
X-Received: by 2002:a17:90a:3aaa:: with SMTP id
 b39mr4681948pjc.73.1595586897137; 
 Fri, 24 Jul 2020 03:34:57 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id b10sm5729034pft.59.2020.07.24.03.34.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 03:34:56 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:04:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200724103454.ttaqxq3hzmth7gpr@vireshk-mac-ubuntu>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
 <20200724055826.GE32086@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724055826.GE32086@dell5510>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] libs: sigwait: Get rid of REPORT_SUCCESS()
 macro
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjQtMDctMjAsIDA3OjU4LCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIFZpcmVzaCwKPiAKPiBS
ZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gCj4gQWx0aG91Z2ggdGhl
c2UgZXJyb3JzIGFyZSBzdGlsbCBoZXJlOgoKSSB3ZW50IHRvIGxpYnMvIGRpcmVjdG9yeSBhbmQg
SSBkb24ndCBnZXQgYW55IHdhcm5pbmdzIHdpdGgKCiQgbWFrZSBjbGVhbjsgbWFrZQoKSG93IGNh
biBJIGdlbmVyYXRlIHRoZXNlIGVhc2lseSA/Cgo+IHNpZ3dhaXQuYzogSW4gZnVuY3Rpb24g4oCY
dGVzdF9tYXNrZWRfbWF0Y2hpbmfigJk6Cj4gc2lnd2FpdC5jOjE1Nzo0Mjogd2FybmluZzogcGFz
c2luZyBhcmd1bWVudCAzIHRvIHJlc3RyaWN0LXF1YWxpZmllZCBwYXJhbWV0ZXIgYWxpYXNlcyB3
aXRoIGFyZ3VtZW50IDIgWy1XcmVzdHJpY3RdCj4gICAxNTcgfCAgVEVTVChzaWdwcm9jbWFzayhT
SUdfU0VUTUFTSywgJm9sZG1hc2ssICZvbGRtYXNrKSk7Cj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfn5+fn5+fn4gIF5+fn5+fn5+Cj4gLi4vLi4vaW5jbHVkZS90c3Rf
dGVzdC5oOjI2NjoxMzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhURVNU4oCZCj4g
ICAyNjYgfCAgIFRTVF9SRVQgPSBTQ0FMTDsgXAogCj4gSU1ITyB3ZSBzaG91bGRuJ3QgdXNlIG9s
ZG1hc2sgZm9yIHNyYyBhbmQgZGVzdC4KCkFuZCBJIGFtIG5vdCByZWFsbHkgc3VyZSB3aGF0IHRo
ZSBlcnJvciBzYXlzIGFuZCB3aHkgaXQgaXMgdGhlcmUuCgotLSAKdmlyZXNoCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
