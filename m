Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 354172FEEF7
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:37:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00BC23C75FD
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:37:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 405223C3040
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:37:09 +0100 (CET)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E81781A00615
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:37:08 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id cq1so1878454pjb.4
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=d8vAb4NI9vr2Bqs/mMOiQWFPco3BYblKGiiolSzYuNM=;
 b=l1oeFihLm43ZGYTkvDvEs/jlNGHpZsmXw/G2FT1elL47emEh9AjK3f9gy4X0N+pClb
 1fY78xi/XhPbAvB4MFonxyQbyo41E59eFTGNWlQ53V1BG917YjW575WRxcHuRqSZGQMC
 yoaHl/iJmFklE4wHs0qzIUsT9JywJnwAhqsYWmqe8FfEQSZDi3ulfSsUvlObUAacoN78
 0rP4s0PMsmhI1EY5wo0hpgOG9SxqBAmSMV7QVAnHEGH23/zFwOhIo190fqB7WrA958xD
 +ISEak5EUAAzHV/J3ASOuzE4gLblams+nA1RHVgPdWIRZ4/TxeVA9PxAirITDEQKE/GG
 P4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=d8vAb4NI9vr2Bqs/mMOiQWFPco3BYblKGiiolSzYuNM=;
 b=kpo0lamvq/vXFkt+u+lQFrl622Xo9mpOWmsnKGCYV5+a/+eQ2qaEFQ3kmXjg8GJrtW
 sH03HeS0RAuaGVft93JQQ8YsPbn3//ESdkNo7ucswLYM6qTHedu/zETmJIqTk/qxElvW
 hboyBTzdRWgGtCtG68SprVkmn1FqyZwxyzCExy0iAwoLEoWPaZiTbMEVVGRqvhlJj3lg
 7FuANKn9W09zmsd2O+skoJkNYbl3sZRL2gamkmWW8KQAJUUDxc6eFoec5GpcandJz5sV
 SwWzFVUhkfYKUV7nPYpzP1w5bopX1yLkebowKMCwyUd/9dedK3RESLNNimaFEciAPUOi
 zOrA==
X-Gm-Message-State: AOAM530tBmU4kbX/+jF4qrWZElBQMmrNzJa3L7t3p2F7SsrZo/6rGlmc
 +3kgyQk1DvOLX4GU8laCeR4=
X-Google-Smtp-Source: ABdhPJw6c81ZjQQ/smyEo3xl3jRaclspch1UEbUR6/0k3P/8X+bnEfwljd24mjxMNb4hfeM7rfrNCw==
X-Received: by 2002:a17:90a:d3d3:: with SMTP id
 d19mr13081901pjw.196.1611243427426; 
 Thu, 21 Jan 2021 07:37:07 -0800 (PST)
Received: from ?IPv6:2607:fb90:b278:27b1:edf9:d0a:5ce:1e3?
 ([2607:fb90:b278:27b1:edf9:d0a:5ce:1e3])
 by smtp.gmail.com with ESMTPSA id c11sm5522691pfl.185.2021.01.21.07.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:37:06 -0800 (PST)
From: Enji Cooper <yaneurabeya@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 21 Jan 2021 07:37:05 -0800
Message-Id: <4303D927-20AA-4161-A91B-460FE14E1703@gmail.com>
References: <20210121105959.1002-1-pvorel@suse.cz>
In-Reply-To: <20210121105959.1002-1-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: iPhone Mail (18C66)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] travis: Test NUMA also on Fedora/CentOS
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

UmV2aWV3ZWQgYnk6IEVuamkgQ29vcGVyIDx5YW5ldXJhYmV5YUBnbWFpbC5jb20+Cgo+IE9uIEph
biAyMSwgMjAyMSwgYXQgMDM6MDAsIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PiB3cm90ZToK
PiAKPiDvu79TaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiAtLS0K
PiBIaSwKPiAKPiB0ZXN0ZWQgKGFmZmVjdGVkIGRpc3Ryb3Mgb25seSkKPiBodHRwczovL3RyYXZp
cy1jaS5vcmcvZ2l0aHViL3BldmlrL2x0cC9idWlsZHMvNzU1NTA1NjkxCj4gCj4gS2luZCByZWdh
cmRzLAo+IFBldHIKPiAKPiB0cmF2aXMvZmVkb3JhLnNoIHwgMSArCj4gMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3RyYXZpcy9mZWRvcmEuc2ggYi90cmF2
aXMvZmVkb3JhLnNoCj4gaW5kZXggNjY1OTE1YTQ3Li5lZjJkMzJmNDcgMTAwNzU1Cj4gLS0tIGEv
dHJhdmlzL2ZlZG9yYS5zaAo+ICsrKyBiL3RyYXZpcy9mZWRvcmEuc2gKPiBAQCAtMTMsNiArMTMs
NyBAQCAkeXVtIFwKPiAgICBnY2MgXAo+ICAgIGdpdCBcCj4gICAgZmluZHV0aWxzIFwKPiArICAg
IG51bWFjdGwtZGV2ZWwgXAo+ICAgIGxpYnRpcnBjIFwKPiAgICBsaWJ0aXJwYy1kZXZlbCBcCj4g
ICAgcGVybC1KU09OIFwKPiAtLSAKPiAyLjMwLjAKPiAKPiAKPiAtLSAKPiBNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
