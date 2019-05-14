Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CB91EB84
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:56:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44EF53EA2E6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:56:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DC1C0294AB1
 for <ltp@lists.linux.it>; Wed, 15 May 2019 01:41:54 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BFDD410016F4
 for <ltp@lists.linux.it>; Wed, 15 May 2019 01:41:50 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id c6so308588pfa.10
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DY6OWxXL6Mkjdnz9bKItmOBCwg7lWspCryDrZpJJELw=;
 b=X4mfkQznNYHZpXmFQYc7WK7z6OUmo6Sk25Nz/vjKV2dkhuYPBTUE6ya8Uuvkk/gBjh
 yA9ixJsoOl6ZMN9xYtfiFtg3vHtMFGQ1iOyOf+mqu3wjSEummwRW/BRDCd+QtgiQZPHj
 pa7E7QrakEnijd59IO6EK+x0NSpSwHa5cORHnMYA76qNEjYcLFOmQ1p30SGuBQR708zp
 CygDrnfb/RYOSwMJwPiynqo8DLa4PyaW8HtNT/zDcyu4TUn3xmi3AVBPGtHTxz+qem38
 Nxe3M+AbbxfJsYvo5uXQMhJnOobYuVgUeifiaAKUUDLjXnmhcvT22u4FH00JEvinEmNk
 a4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DY6OWxXL6Mkjdnz9bKItmOBCwg7lWspCryDrZpJJELw=;
 b=Yaa7UEA5xoPCvp3Ua6BC7olA+kb87Jv1PsILmuZBfkoyzE2LWNELk79+3AiFs1+fRH
 FRwzNNaNvqyZvoWkkDZGoXB560RRLsD/g5Cf7qcNSUyneoaVkMQ8KAi8z3qo1G7JWH47
 XUX9sqNlhcMLXz3n/bGw2MkBidss/ixmMo/lvIOl0m8Oeytrac+jJYcOipxpG7Gt8f7R
 hRzujXDQVdUC/9YoQM6+jJG7vP2zL1LM/ferhJ6WwR0Ej/9bFZAYB0TxdNl5/anbGhgt
 mzPAR656Tcixx1pIbL4j2eMLDcno7Gf8+KtlVHsN+xG5lijsRSsB3mAar0FFepRAoA7/
 43/w==
X-Gm-Message-State: APjAAAWPUhLGNH+HKqr3Pq2oUgSZam2A80/zjG/FXe5AAM8ImhM6DaYP
 HC3aLqjGUe98kUVEJEzy57A=
X-Google-Smtp-Source: APXvYqwNBpkrVnbSQYAwgohdGmjunNQdCGyoDBa+JV+/+DN57azD9XaTe7h6TpYw5x0TTy4MoQNjgQ==
X-Received: by 2002:a63:4346:: with SMTP id q67mr40722725pga.241.1557877311862; 
 Tue, 14 May 2019 16:41:51 -0700 (PDT)
Received: from localhost ([2601:640:5:a19f:19d3:11c4:475e:3daa])
 by smtp.gmail.com with ESMTPSA id u123sm290199pfu.67.2019.05.14.16.41.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 16:41:51 -0700 (PDT)
Date: Tue, 14 May 2019 16:41:49 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190514234149.GA12077@yury-thinkpad>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
 <20190508225900.GA14091@yury-thinkpad> <mvmtvdyoi33.fsf@suse.de>
 <MN2PR18MB30865B950D85C6463EB0E1D4CB0F0@MN2PR18MB3086.namprd18.prod.outlook.com>
 <20190514104311.GA24708@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514104311.GA24708@rei>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
ZXN0IGluIExUUD8KPiAKPiBXZSBkbyBoYXZlIGEgdGVzdCB0aGF0IHdlIGNhbiBydW4gYSBiaW5h
cnkgd2l0aCB2ZXJ5IHNtYWxsIHN0YWNrIHNpemUKPiBpLmUuIDUxMmtCIGJ1dCB0aGVyZSBkb2Vz
IG5vdCBzZWVtIHRvIGJlIGFueXRoaW5nIHRoYXQgd291bGQgY2F0Y2ggdGhpcwo+IHNwZWNpZmlj
IHByb2JsZW0uCj4gCj4gQ2FuIHlvdSBwbGVhc2Ugb3BlbiBhbiBpc3N1ZSBhbmQgZGVzY3JpYmUg
aG93IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbQo+IGF0IG91ciBnaXRodWIgdHJhY2tlcjoKPiAK
PiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9pc3N1ZXMKPiAKPiBU
aGVuIHdlIGNhbiBjcmVhdGUgdGVzdGNhc2UgYmFzZWQgb24gdGhhdCByZXByb2R1Y2VyIGxhdGVy
IG9uLgoKVGhpcyBpcyBpdDoKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9s
dHAvaXNzdWVzLzUzMAoKWXVyeQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
