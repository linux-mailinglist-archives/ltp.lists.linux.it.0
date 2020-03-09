Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D288717EBA7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 23:04:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 702183C615A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 23:04:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B1A023C6131
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 23:04:22 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B81982003BE
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 23:04:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583791460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvJTacKjNVOztH256dZHpNYhzX5dRhKvlA341VjdCi8=;
 b=Uf816iHzFdgRt9B1h54EOGetWFZaeDFW45+cNWSPl4A4kayeiBf8XtWyV13gCAs0IcX4Zv
 IThN6A1tlCsw3tGPyqlNZquZT9PNGmCytKD+23EU6hKKq1IaGou4oQ+VKMmyBJuzes4vFO
 sV08UFakar/9pMql7dTVpvm+9GYnY1s=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-011m_DeLOVq05UDpBetJww-1; Mon, 09 Mar 2020 18:04:09 -0400
X-MC-Unique: 011m_DeLOVq05UDpBetJww-1
Received: by mail-oi1-f197.google.com with SMTP id q130so2552148oia.12
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 15:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yvJTacKjNVOztH256dZHpNYhzX5dRhKvlA341VjdCi8=;
 b=p0/lsabNHZM2Y3KAckyKdx2oZ+eWhyG2n6y9ds3E0Fo8RZhOjlxlbialudz4iwI7Hf
 vbdJqU8ol6TBFXXr9g6YR2g4ZXCQ4umX9IJmizOcGztPaYVm/Q+XW9USj0zhJzYzV5u1
 p25P/eyVNJ2etvzuuEFmxlkEqZKAskpn0Tb2ZeWsaqBa0PXxz8up0ROAs9ZaWsTj8WtC
 8ml+8bYcB9/viI+ITCZxMsMJdTt04+Fx9r2GD/+o0rCIlB/htVU1zQkMdjFvkDMDkNWE
 wqE9T3pxIzA0UgcbtDTyOGOzAhCdCKJpmy0mlKQ/yZl0O0QPapxa2l3u9ohR0OpjF7Zf
 1COQ==
X-Gm-Message-State: ANhLgQ0zI+HQS64tZysvova3mDm40g0qKn50nn1YNfp2P8zXiZ3cUiW/
 1BMiUZRRUp4W+/Q0+KnSGyoK63bhGZXChv3lmM7LopenunaKpPh6hWCR/Y/TS8/rFmq0A/BBMga
 6pLUBMVMvImZeEzxYKVMOdNhvFqw=
X-Received: by 2002:a9d:7458:: with SMTP id p24mr2890854otk.197.1583791448775; 
 Mon, 09 Mar 2020 15:04:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsFE8SXSJ8i3wT/MUNuNnTpNxro53ctEUbxx3P0T+4oUrP1CSaaaAbP5OdDtfFhAVMUywBT7KEphLu8efKRKdk=
X-Received: by 2002:a9d:7458:: with SMTP id p24mr2890827otk.197.1583791448361; 
 Mon, 09 Mar 2020 15:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <cki.411617A928.D7E40QQCW6@redhat.com>
 <20200309215305.GV21491@sasha-vm>
In-Reply-To: <20200309215305.GV21491@sasha-vm>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Mon, 9 Mar 2020 23:03:57 +0100
Message-ID: <CAFqZXNugDTJ8MQePK1Cyz2TOJiPcPrq3ohmNZngJjaTCq1Y6mQ@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
	=?utf-8?q?=2E5=2E8-c30f33b=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, Ondrej Moris <omoris@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgU2FzaGEsCgpPbiBNb24sIE1hciA5LCAyMDIwIGF0IDEwOjUzIFBNIFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAwOSwgMjAyMCBhdCAwOToy
NDozNVBNIC0wMDAwLCBDS0kgUHJvamVjdCB3cm90ZToKPiA+Cj4gPkhlbGxvLAo+ID4KPiA+V2Ug
cmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0
cmVlOgo+ID4KPiA+ICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gICAg
ICAgICAgICBDb21taXQ6IGMzMGYzM2JmYjAxNCAtIHNlbGZ0ZXN0czogZm9yd2FyZGluZzogdnhs
YW5fYnJpZGdlXzFkOiB1c2UgbW9yZSBwcm9wZXIgdG9zIHZhbHVlCj4gPgo+ID5UaGUgcmVzdWx0
cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+ID4KPiA+ICAg
IE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ID4gICAgICAgICAg
ICAgTWVyZ2U6IE9LCj4gPiAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ICAgICAgICAgICAgIFRl
c3RzOiBQQU5JQ0tFRAo+ID4KPiA+QWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBh
bmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+ID4KPiA+ICBodHRwczov
L2NraS1hcnRpZmFjdHMuczMudXMtZWFzdC0yLmFtYXpvbmF3cy5jb20vaW5kZXguaHRtbD9wcmVm
aXg9ZGF0YXdhcmVob3VzZS8yMDIwLzAzLzA5LzQ4MDE1OAo+ID4KPiA+T25lIG9yIG1vcmUga2Vy
bmVsIHRlc3RzIGZhaWxlZDoKPiA+Cj4gPiAgICBzMzkweDoKPiA+ICAgICDinYwgTFRQCj4gPgo+
ID4gICAgcHBjNjRsZToKPiA+ICAgICDinYwgTFRQCj4gPgo+ID4gICAgYWFyY2g2NDoKPiA+ICAg
ICDinYwgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0Cj4gPgo+ID4gICAgeDg2XzY0Ogo+ID4g
ICAgIOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QKPgo+IEZvbGxvd2luZyB0aGUgbGlu
ayBhYm92ZSBJIGdvdCB0bwo+IGh0dHBzOi8vY2tpLWFydGlmYWN0cy5zMy51cy1lYXN0LTIuYW1h
em9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRhd2FyZWhvdXNlLzIwMjAvMDMvMDkvNDgw
MTU4L2F1ZGl0X19hdWRpdF90ZXN0c3VpdGVfdGVzdC8sCj4gYnV0IGl0IHNob3dzIHRoYXQgYWxs
IHRlc3RzIGFyZSBwYXNzaW5nPyBUaGUgY29uc29sZSBsb2cgbG9va3MgZmluZSB0b286Cj4gaHR0
cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2RhdGF3YXJlaG91
c2UvMjAyMC8wMy8wOS80ODAxNTgveDg2XzY0XzVfY29uc29sZS5sb2cuCj4gV2hlcmUncyB0aGUg
cGFuaWM/CgpUaGUgcGFuaWMgaGFwcGVuZWQgZHVyaW5nIHRoZSBMVFAgdGVzdCBvbiBzMzkweCAo
bm90ZSB0aGUgbGlnaHRuaW5nCnN5bWJvbHMgdW5kZXIgczM5MHgsIEhvc3QgMSkuIFRoZSBiYWNr
dHJhY2UgaXMgYXQgdGhlIGVuZCBvZgpodHRwczovL2NraS1hcnRpZmFjdHMuczMudXMtZWFzdC0y
LmFtYXpvbmF3cy5jb20vZGF0YXdhcmVob3VzZS8yMDIwLzAzLzA5LzQ4MDE1OC9zMzkweF8xX2Nv
bnNvbGUubG9nCgpDaGVlcnMsCgotLSAKT25kcmVqIE1vc25hY2VrIDxvbW9zbmFjZSBhdCByZWRo
YXQgZG90IGNvbT4KU29mdHdhcmUgRW5naW5lZXIsIFNlY3VyaXR5IFRlY2hub2xvZ2llcwpSZWQg
SGF0LCBJbmMuCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
