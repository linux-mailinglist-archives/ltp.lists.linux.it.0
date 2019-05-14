Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBD1C750
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 12:55:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBAC33EA2F6
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 12:55:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C3B4D3EA20D
 for <ltp@lists.linux.it>; Tue, 14 May 2019 12:43:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B1AE5600807
 for <ltp@lists.linux.it>; Tue, 14 May 2019 12:43:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4BF7AC3F;
 Tue, 14 May 2019 10:43:13 +0000 (UTC)
Date: Tue, 14 May 2019 12:43:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yuri Norov <ynorov@marvell.com>
Message-ID: <20190514104311.GA24708@rei>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
 <20190508225900.GA14091@yury-thinkpad> <mvmtvdyoi33.fsf@suse.de>
 <MN2PR18MB30865B950D85C6463EB0E1D4CB0F0@MN2PR18MB3086.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR18MB30865B950D85C6463EB0E1D4CB0F0@MN2PR18MB3086.namprd18.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 14 May 2019 12:55:20 +0200
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Joseph Myers <joseph@codesourcery.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Steve Ellcey <sellcey@caviumnetworks.com>, Arnd Bergmann <arnd@arndb.de>,
 Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
 Andreas Schwab <schwab@suse.de>, Alexander Graf <agraf@suse.de>,
 Bamvor Zhangjian <bamv2005@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Martin <Dave.Martin@arm.com>,
 Adam Borowski <kilobyte@angband.pl>,
 Manuel Montezelo <manuel.montezelo@gmail.com>,
 James Hogan <james.hogan@imgtec.com>, Chris Metcalf <cmetcalf@mellanox.com>,
 Yury Norov <yury.norov@gmail.com>, Andrew Pinski <pinskia@gmail.com>,
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

SGkhCj4gPiBUaGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgc3RhY2sgc2l6ZSBhY2NvdW50aW5n
IGR1cmluZyBleGVjdmUgd2hlbgo+ID4gdGhlcmUgaXMgbm8gc3RhY2sgbGltaXQ6Cj4gPgo+ID4g
JCB1bGltaXQgLXMKPiA+IDgxOTIKPiA+ICQgLi9oZWxsby5pbHAzMiAKPiA+IEhlbGxvIFdvcmxk
IQo+ID4gJCB1bGltaXQgLXMgdW5saW1pdGVkCj4gPiAkIC4vaGVsbG8uaWxwMzIgCj4gPiBTZWdt
ZW50YXRpb24gZmF1bHQKPiA+ICQgc3RyYWNlIC4vaGVsbG8uaWxwMzIgCj4gPiBleGVjdmUoIi4v
aGVsbG8uaWxwMzIiLCBbIi4vaGVsbG8uaWxwMzIiXSwgMHhmZmZmZjEwNTQ4ZjAgLyogNzcgdmFy
cyAqLykgPSAtMSBFTk9NRU0gKENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkpCj4gPiArKysga2lsbGVk
IGJ5IFNJR1NFR1YgKysrCj4gPiBTZWdtZW50YXRpb24gZmF1bHQgKGNvcmUgZHVtcGVkKQo+ID4K
PiA+IEFuZHJlYXMuCj4gCj4gVGhhbmtzIEFuZHJlYXMsIEkgd2lsbCB0YWtlIGEgbG9vay4gRG8g
d2UgaGF2ZSBzdWNoIHRlc3QgaW4gTFRQPwoKV2UgZG8gaGF2ZSBhIHRlc3QgdGhhdCB3ZSBjYW4g
cnVuIGEgYmluYXJ5IHdpdGggdmVyeSBzbWFsbCBzdGFjayBzaXplCmkuZS4gNTEya0IgYnV0IHRo
ZXJlIGRvZXMgbm90IHNlZW0gdG8gYmUgYW55dGhpbmcgdGhhdCB3b3VsZCBjYXRjaCB0aGlzCnNw
ZWNpZmljIHByb2JsZW0uCgpDYW4geW91IHBsZWFzZSBvcGVuIGFuIGlzc3VlIGFuZCBkZXNjcmli
ZSBob3cgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtCmF0IG91ciBnaXRodWIgdHJhY2tlcjoKCmh0
dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2lzc3VlcwoKVGhlbiB3ZSBj
YW4gY3JlYXRlIHRlc3RjYXNlIGJhc2VkIG9uIHRoYXQgcmVwcm9kdWNlciBsYXRlciBvbi4KCi0t
IApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
