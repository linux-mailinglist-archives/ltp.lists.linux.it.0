Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FEC25F5
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 20:28:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B92373C233B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 20:28:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C72883C0781
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 20:28:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9D901200B6F
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 20:28:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46D05AF5D;
 Mon, 30 Sep 2019 18:28:00 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>, cfamullaconrad@suse.com
References: <20181003113215.GB21139@dell5510>
 <cover.1566500817.git.clanig@suse.com>
 <ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com>
 <20190919164151.GB20853@x230>
From: Christian Lanig <clanig@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=clanig@suse.com; keydata=
 mDMEXAEU7RYJKwYBBAHaRw8BAQdANOkvcn8Z+w2HnKycnsVSpzK3N/3YEHJPChi0QQ8QIuq0
 IUNocmlzdGlhbiBMYW5pZyA8Y2xhbmlnQHN1c2UuY29tPoiPBBMWCAA3FiEELCMlz9+8btpw
 cP5sULrWNE4+V5MFAlwBFO0CGwMFCwkIBwIGFQoJCAsCAxYCAQIeAQIXgAAKCRBQutY0Tj5X
 k4ErAPwIyjcY/CSgs/H4P7P3q6kclbE5tk2AQ/U0/UPvMR+KswD/XA130rUHgobAoLn6O6rj
 47QCcU/MX7HQWoHZfZ06vQm0IENocmlzdGlhbiBMYW5pZyA8Y2xhbmlnQHN1c2UuZGU+iI8E
 ExYIADcWIQQsIyXP37xu2nBw/mxQutY0Tj5XkwUCXAEVmwIbAwULCQgHAgYVCgkICwIDFgIB
 Ah4BAheAAAoJEFC61jROPleTTq4A/iePn5+FXArrWoQXAsHVx1yuwMZs0ue2A00UDckgfAZa
 AQDUhpv/ipfWJP01x6EK+/T5ArxhhVQuB8Ks+HZR4fW3D7QnQ2hyaXN0aWFuIExhbmlnIDxj
 aHJpc3RpYW5AbGFuaWcuZW1haWw+iI8EExYIADcWIQQsIyXP37xu2nBw/mxQutY0Tj5XkwUC
 XAEWlgIbAwULCQgHAgYVCgkICwIDFgIBAh4BAheAAAoJEFC61jROPleT8o4A/3JN2rz8ExPC
 Lb8qSKAvDWMhzCjyosOcp2nj7o/GIJUeAP97COx3Sw4oL/EJu+bkVekZJuTr5xg8if/qXjQC
 23I0Arg4BFwBFO0SCisGAQQBl1UBBQEBB0CEeXx/YmBx7pl1b9c8i8Hk2cPw8GMtiNhihQiG
 xU8TcQMBCAeIeAQYFggAIBYhBCwjJc/fvG7acHD+bFC61jROPleTBQJcARTtAhsMAAoJEFC6
 1jROPleTa7kA/RwyvMYHuhB91enOSU/KzGsq9fOaKtjEcQtoT1Tp7XCNAP9SaGeaUJUvzyie
 8JSoJ9Jsy54XvP+AURgLKiSgCYZjAbkCDQRcBaUhARAArskHM+LRc5QmdPOvx/vCb0iwV2bT
 k3jhezjKQyV4KdRBxbZchSyK7QBfmS4R/VLKZ/9M8stUFZMju7iR+ZsC4lEMInrO+TKUa69p
 GkdT/TQfcnS4ErWbJ764dSbZjSg7Bb0NoRSveqcSXbdISqxAT3kf/f1OOgJwPpOZwZzfOyqE
 YBfslq2LITxv4uhSlHFpjQRj6YBbhy5XgLsHs6U1jWLk9pGPT/3hYBw4pI423hBLW3Ju0C4R
 cmERJESpQ16rCPsqDLUgp3uJh9eUkEW6sblBG/5sfBjqPBl4gpW+sUXt+4WTI9P8AVBDb6j8
 L39fktalLi5MV7aNye8S6meA/ti365fuenRvv6cw/0pdvPn8jYJABIHRE9/JMOgzM4r3LGxL
 6aMyQ6UF3fDmPuP3IJ9rsvdiwqMMixE0gqy7QmELaFTe77Fkk9Ne5rFmTUY3eaXlyvS8R5nb
 f/+ZzgApT8qV128Wg0p+9Vyr1YvHKJW35SdV3AoAP9oIueWqReg7HLGdzsX4U1bRaT/cgbmt
 ZfCQpej+Hp/+SxSYfY6e1vjEh+GVupsQXGj3H8r38yJud2cJN01kj7xHpv1wiHKRoldCyXV8
 tdL7vV1h8lVD9vrICfUix63teGizOgvlmDqWbC4ZtnxD2GSxXbt/l+w5zHYQ6khlpYKWm6TR
 6OibsnEAEQEAAYh4BBgWCAAgFiEELCMlz9+8btpwcP5sULrWNE4+V5MFAlwFpSECGwwACgkQ
 ULrWNE4+V5NF3QEA+IXkQeMP6kQtdag19ml4CEJw1tyq9ZEli9leZDoiZ1ABAMys3J0tMU//
 hyMeArNThZ0XiAlaDe1mM11RfpUljBgP
Message-ID: <ce127270-9575-623b-2505-5975db0ea645@suse.com>
Date: Mon, 30 Sep 2019 20:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919164151.GB20853@x230>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] Add automated tests for shell lib
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

SGkgUGV0ciBhbmQgQ2xlbWVucywKCnRoYW5rIHlvdSBmb3IgdGhlIHJlYXNvbmFibGUgY29tbWVu
dHMgYW5kIHN1Z2dlc3Rpb25zLgoKSSBqdXN0IHdhbnQgdG8gdGVsbCB5b3UgdGhhdCBJIHdpbGwg
bm90IGJlIGFibGUgdG8gd29yayBvbiB0aGlzIHVudGlsCm5leHQgd2Vlay4gSSBhcHByZWNpYXRl
IHlvdXIgcGF0aWVuY2UgdmVyeSBtdWNoLgoKUmVnYXJkcywKCkNocmlzdGlhbgoKLS0gCkNocmlz
dGlhbiBMYW5pZyAtIFNVU0UgRW5naW5lZXJpbmcgQXBwcmVudGljZQpTVVNFIExpbnV4IEdtYkgs
IE1heGZlbGRzdHJhw59lIDUsIEQtOTA0MDkgTsO8cm5iZXJnClRlbDogKzQ5LTkxMS03NDA1My0w
OyBGYXg6ICs0OS05MTEtNzQxNzc1NTsgIGh0dHBzOi8vd3d3LnN1c2UuY29tLwpHRjogRmVsaXgg
SW1lbmTDtnJmZmVyLCBKYW5lIFNtaXRoYXJkLCBHcmFoYW0gTm9ydG9uLCBIUkIgMjEyODQgKEFH
IE7DvHJuYmVyZykKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
