Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466930A47
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:28:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 608EA2987A2
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:28:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B57C53EA195
 for <ltp@lists.linux.it>; Fri, 31 May 2019 09:41:52 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 42C2E6021C2
 for <ltp@lists.linux.it>; Fri, 31 May 2019 09:41:51 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hWcAg-0004tu-UX
 for ltp@lists.linux.it; Fri, 31 May 2019 07:41:51 +0000
Received: by mail-ed1-f71.google.com with SMTP id y24so12558997edb.1
 for <ltp@lists.linux.it>; Fri, 31 May 2019 00:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GlakVrVqkwXJAq4P4OmHnzQU8QzGzplymW9E3mWiQLg=;
 b=r61MspO5SfMUWRdBuqgD3dbdGcF4P6MZd+fGDAISIyYRG8LploEvzRT5xXAb/0TYhD
 7SobLVBUQLN5Y+4cngBUr5KnrZbqxnsWzJIdO1n2IvovyVWgJ93Knlir4ufVaHc9YlKo
 o0RpQdrD2K46TlKnVhifxqKOfVZel/jrkzYckVkfxGAD4EgQA0nvq3+JQRoTakkI1oHM
 C/gzo7DRntImoqNkrlWIQLDKK0KBR9hn/8NKGljXGtPLJcyZ+xzcJbdfCEj2h2myHEjt
 UhnvdO2UK8jb4tLfFW68fp9ReQAzH5CTtvfBikf/DKn5tBrb7B8w9JiM1i/Szj/LJS9D
 LXKg==
X-Gm-Message-State: APjAAAUq+72Za73kzkJy9e6C4LL6Mzn6PMiq5YdtspJhJGTWBovA3SC1
 IeD3W1ge39BHhM3dy0XPaCyh+J4zUgiTWcIYvLWDOqTl5L/dXX9vnolK5aYBQngCgni/kniPhCs
 wNN37vKvg/TCA0VVDnvL0WE35T2ffSKrKaKDSbwm2DVo=
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr7908374ejb.251.1559288510360; 
 Fri, 31 May 2019 00:41:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzE9HMvH0zNCe6tjo9i4Der8pohOFBzYEjJObnIkdvvoyf7J8esYEjKCkFdx8JFP1OGkQuqjeDIY2yg86qvmYM=
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr7908361ejb.251.1559288510107; 
 Fri, 31 May 2019 00:41:50 -0700 (PDT)
MIME-Version: 1.0
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Fri, 31 May 2019 15:41:39 +0800
Message-ID: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 31 May 2019 10:28:58 +0200
Subject: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gZm9sa3MsCgpXZSBmb3VuZCBvdXQgdGhhdCB3aGVuIHJ1bm5pbmcgdGhlIExUUCB0ZXN0
IHN1aXRlIGRpcmVjdGx5ICh3aGljaCB1c2VzCnRoZSAiZGVmYXVsdCIgZmlsZSBpbiBzY2VuYXJp
b19ncm91cHMpLiBUaGUgaW5zbW9kMDFfc2ggd2lsbCBpbnNlcnQgYW4Kb3V0LW9mLXRyZWUgbW9k
dWxlIGFuZCB0YWludHMgdGhlIGtlcm5lbCwgYW5kIHRoZSBmb2xsb3dpbmcKY3ZlLTIwMTctMTcw
NTMgdGVzdCBpbiB0aGUgY3ZlIHRlc3Qgc3VpdGUgd2lsbCBjaGVjayBpZiB0aGUga2VybmVsIGlz
CnRhaW50ZWQuIFRodXMgY2F1c2luZyBzb21lIGZhbHNlLXBvc2l0aXZlIGluIHRoZSB0ZXN0IHJl
c3VsdC4KClBlcmhhcHMgYSB3b3JrYXJvdW5kIGlzIHRvIG1vdmUgdGhlIGN2ZSB0ZXN0IHN1aXRl
IHRvIHNvbWV3aGVyZSBiZWZvcmUKdGhlIGNvbW1hbmRzIHRlc3Qgc3VpdGUgaW4gdGhlICJkZWZh
dWx0IiBzY2VuYXJpby4KCkJ1Z0xpbms6IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3Mv
MTgzMDAxMQoKVGhhbmtzCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
