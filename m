Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D91EB83
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:56:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4636C2987AC
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:56:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 217F5294AB1
 for <ltp@lists.linux.it>; Wed, 15 May 2019 01:03:13 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 14E95200DF0
 for <ltp@lists.linux.it>; Wed, 15 May 2019 01:03:12 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id y3so334342plp.0
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4xuOhafijhTBKjPcHvwICr8fCf3XDF6k7moLbg3FXwg=;
 b=f+iki57StuAV+FkmK28LEJUx6eRLXHSLyK478LBU5ugMCQKEKAZdX23XdU0hTop3GI
 xGJewyrbS+bCN0qDv8n7PLgw3R8cXpE0K/wG2jRzQacmvbhYfW7oSLUF0VZeH68ddsoC
 qCNTE4tz3BD6ag5z4FRz+GrqR1A+UYG9qKbww7xnZsjPhVhqd+6O8objP/SAgY/BQF1Q
 ivbwlEgshLeExC9RVBfCEAUIXWs05qZfaYgSJfxqkwNiFZ85iJBc25BjSEsCaj8LJ185
 thGVy5+SA6YMXpJunfpxoxvi7Ld/QsAGJr58tOGd2mFNOsejpsJWS0s/mxLb0Izfo4iT
 76Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4xuOhafijhTBKjPcHvwICr8fCf3XDF6k7moLbg3FXwg=;
 b=Ze+6kCDGK2qwzzJajTJanxDEWPfQbdPMpXSIT7iko7R0F6Vwlyx/zipeao6rlYK5MA
 OnhoZs/75sCM6Qsza5b+12Df8lPG8MW3XrUgUlaOGqJX8PTu5ghS3kL80hqR7An7Tbb4
 xaFrL2RS1mLNEXjOh5Sx1WN7BXM4p5haDXNsiJtdN0Y1jmySxxnjwDUZvBc+LzWy3trD
 UhPwCB99W5W5bDp65VnTlX7IijghTGFlbRuU9ZnkAATm+DpA+bDjrWQ8QQwWy5hudnFf
 tHwcT51IKK5dETBUopa3ZUK7KSIYsjxzlRoef24AJ2Kh7FaZzhuxgBObdA6D1zES69De
 5AqQ==
X-Gm-Message-State: APjAAAWQOvCRvMbMboN7fwH1rIqnqV0eGCam5ries1xfY6JwFT9qJGU3
 RAUxp8xoBsEhdB17NFiiXAE=
X-Google-Smtp-Source: APXvYqy3fmo7/ncm6lIHtrFpfQoSewVnPVoZDijQHrQxC4R9KBEXyV2Q9ZJU/PMMxrsLSU8w/4pXOg==
X-Received: by 2002:a17:902:5983:: with SMTP id
 p3mr38930332pli.224.1557874990361; 
 Tue, 14 May 2019 16:03:10 -0700 (PDT)
Received: from localhost ([2601:640:5:a19f:19d3:11c4:475e:3daa])
 by smtp.gmail.com with ESMTPSA id l65sm238391pfb.7.2019.05.14.16.03.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 16:03:09 -0700 (PDT)
Date: Tue, 14 May 2019 16:01:58 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190514230158.GA6780@yury-thinkpad>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
 <20190508225900.GA14091@yury-thinkpad> <mvmtvdyoi33.fsf@suse.de>
 <MN2PR18MB30865B950D85C6463EB0E1D4CB0F0@MN2PR18MB3086.namprd18.prod.outlook.com>
 <20190514104311.GA24708@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514104311.GA24708@rei>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 15 May 2019 11:56:07 +0200
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Joseph Myers <joseph@codesourcery.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Steve Ellcey <sellcey@caviumnetworks.com>, Yuri Norov <ynorov@marvell.com>,
 Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
 Andreas Schwab <schwab@suse.de>, Alexander Graf <agraf@suse.de>,
 Bamvor Zhangjian <bamv2005@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Martin <Dave.Martin@arm.com>,
 Adam Borowski <kilobyte@angband.pl>,
 Manuel Montezelo <manuel.montezelo@gmail.com>,
 James Hogan <james.hogan@imgtec.com>, Chris Metcalf <cmetcalf@mellanox.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Pinski <pinskia@gmail.com>,
 Lin Yongting <linyongting@huawei.com>, Alexey Klimov <klimov.linux@gmail.com>,
 Mark Brown <broonie@kernel.org>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
 Florian Weimer <fweimer@redhat.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Nathan_Lynch <Nathan_Lynch@mentor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ramana Radhakrishnan <ramana.gcc@googlemail.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [LTP] [EXT] Re: [PATCH v9 00/24] ILP32 for ARM64
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6NDM6MTFQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gPiBUaGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgc3RhY2sgc2l6ZSBh
Y2NvdW50aW5nIGR1cmluZyBleGVjdmUgd2hlbgo+ID4gPiB0aGVyZSBpcyBubyBzdGFjayBsaW1p
dDoKPiA+ID4KPiA+ID4gJCB1bGltaXQgLXMKPiA+ID4gODE5Mgo+ID4gPiAkIC4vaGVsbG8uaWxw
MzIgCj4gPiA+IEhlbGxvIFdvcmxkIQo+ID4gPiAkIHVsaW1pdCAtcyB1bmxpbWl0ZWQKPiA+ID4g
JCAuL2hlbGxvLmlscDMyIAo+ID4gPiBTZWdtZW50YXRpb24gZmF1bHQKPiA+ID4gJCBzdHJhY2Ug
Li9oZWxsby5pbHAzMiAKPiA+ID4gZXhlY3ZlKCIuL2hlbGxvLmlscDMyIiwgWyIuL2hlbGxvLmls
cDMyIl0sIDB4ZmZmZmYxMDU0OGYwIC8qIDc3IHZhcnMgKi8pID0gLTEgRU5PTUVNIChDYW5ub3Qg
YWxsb2NhdGUgbWVtb3J5KQo+ID4gPiArKysga2lsbGVkIGJ5IFNJR1NFR1YgKysrCj4gPiA+IFNl
Z21lbnRhdGlvbiBmYXVsdCAoY29yZSBkdW1wZWQpCj4gPiA+Cj4gPiA+IEFuZHJlYXMuCj4gPiAK
PiA+IFRoYW5rcyBBbmRyZWFzLCBJIHdpbGwgdGFrZSBhIGxvb2suIERvIHdlIGhhdmUgc3VjaCB0
ZXN0IGluIExUUD8KClNvIHRoZSBwcm9ibGVtIHdhcyBpbiBub3QgY29udmVydGluZyBuZXcgY29t
cGF0LXNlbnNpdGl2ZSBjb2RlOgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCmluZGV4IDVi
ZGYzNTcxNjlkOC4uYzUwOWY4M2ZhNTA2IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgK
QEAgLTYzLDcgKzYzLDcgQEAKIAkJCQlUQVNLX1NJWkVfMzIgOiBUQVNLX1NJWkVfNjQpCiAjZGVm
aW5lIFRBU0tfU0laRV9PRih0c2spCShpc19jb21wYXRfdGhyZWFkKHRzaykgPyBcCiAJCQkJVEFT
S19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQotI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cJKHRl
c3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKKyNkZWZpbmUgREVGQVVMVF9NQVBfV0lORE9X
CShpc19jb21wYXRfdGFzaygpID8gXAogCQkJCVRBU0tfU0laRV8zMiA6IERFRkFVTFRfTUFQX1dJ
TkRPV182NCkKICNlbHNlCiAjZGVmaW5lIFRBU0tfU0laRQkJVEFTS19TSVpFXzY0CgpUaGUgZml4
IGlzIGluY29ycG9yYXRlZCBpbiBpbHAzMi01LjEuMToKaHR0cHM6Ly9naXRodWIuY29tL25vcm92
L2xpbnV4L3RyZWUvaWxwMzItNS4xLjEKCj4gV2UgZG8gaGF2ZSBhIHRlc3QgdGhhdCB3ZSBjYW4g
cnVuIGEgYmluYXJ5IHdpdGggdmVyeSBzbWFsbCBzdGFjayBzaXplCj4gaS5lLiA1MTJrQiBidXQg
dGhlcmUgZG9lcyBub3Qgc2VlbSB0byBiZSBhbnl0aGluZyB0aGF0IHdvdWxkIGNhdGNoIHRoaXMK
PiBzcGVjaWZpYyBwcm9ibGVtLgo+IAo+IENhbiB5b3UgcGxlYXNlIG9wZW4gYW4gaXNzdWUgYW5k
IGRlc2NyaWJlIGhvdyB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0KPiBhdCBvdXIgZ2l0aHViIHRy
YWNrZXI6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvaXNz
dWVzCj4gCj4gVGhlbiB3ZSBjYW4gY3JlYXRlIHRlc3RjYXNlIGJhc2VkIG9uIHRoYXQgcmVwcm9k
dWNlciBsYXRlciBvbi4KPiAKPiAtLSAKPiBDeXJpbCBIcnViaXMKPiBjaHJ1YmlzQHN1c2UuY3oK
Ck9LLCBJJ2xsIGRvLgoKWXVyeQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
