Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A331FF186
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 14:24:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D17E13C2C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 14:24:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EB7E73C1D1C
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 14:24:10 +0200 (CEST)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8033360081C
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 14:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1592483046;
 bh=tmXd2xdN5zjjoR2X7SSOlkJSwyR30y2B4+I0mMMV65U=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=TR/srzXwB5RHbebaJ+5eqRp/LZZDLTVU65Fh0DnE8vrpS1XOaF3ZKeVB9izkOroVA
 OEkyd92EWzxNJqYtXh/HFd/LpVG7yo/+2fdilEXG1AdpGfDCJT0+JlKUfEPP3lTJ86
 Olz6El2REal+2rO3gU5ao6GeDVsqdTyei8i6AtEU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.63]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1jbkAV2hAb-00CQ0U; Thu, 18
 Jun 2020 14:24:06 +0200
To: Pravin Raghul <pravinraghul@zilogic.com>, ltp@lists.linux.it
References: <c6792053-287d-7a53-477d-5f5ad95ffa6f@zilogic.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <35bbf85f-e689-2aab-5b0d-0f045ad04b3a@gmx.de>
Date: Thu, 18 Jun 2020 14:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c6792053-287d-7a53-477d-5f5ad95ffa6f@zilogic.com>
Content-Language: en-US
X-Provags-ID: V03:K1:SkjKQxe/eV+xghvwdbp27ZXprUU+IvViwvXnu8hRfkufuFTbabO
 +p7CYDBcXNbuRoIfCtU7e7rpPY9AuqSNVIl0ffDocRXxWD75BlYt0BiIMPb2NrATCenLy1Q
 +9I9T+7/F3qyk2vh529HO9tSiHrASqnwjDeKe4ysns0IrsdOVehOXInvo79sLIO0zCTmsON
 99MCy6Z+DNJKj9YaLD8ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/XuUITFixSM=:rFXQjxilxFmwk5ibF1yubG
 LzjlLr1VlAgCLFt9GzW2CyXJwMg+0Xvj6CgVlg0I65UhtjxOQ5hR+d6r0z2tQ5zwjzHcLBec2
 xvy98PtUyBo2FAzsViXYJ1OgUE6t8PeFUYOz2PHl9Lfl1pozDzQhZw8hNw71D7+AvssB+CZGl
 P8xPF1Qp3skfdXfNze4bwA70IP83xbGChL7I0pr9/2QPRmHkwymYCwvMJJ5qrI0loa23b6AoP
 QjPr/VDC2CLMgtQ2TC8ZM530F5X5xtLNXz1kMt4sbEzsCldgRNhG93H8mHTkTGgT+YQmejTyU
 h8P7orfz8F0e83ZYQzVuqXMJHD/goagwpNkCRPNgX8Pf5NiW2atuf83NEh2C5hhlxTkA969Nn
 65iMJkTsj12GDMOz3rLtrcyNJu6v+HRxtIJWnMoG+ddXu3mJYcUhmH3H59VI2iQW3NF9swl+x
 kd27uwPbU6khOI/p1i5lBg6AZyKxJ3N1ATyXs9cgHPYkZ9ALz3QD/7A7LzWrig/U5zKS8eGmY
 uxFSMLefaqcRD4YHTHFalH65mjF3Z1SGGHsOEJK/5HKKppUThkxdpfZA2uAy5s3WnBdtRqh2b
 vAYqb77x5b9HieNOG29AwyfkWl0cDqveDhVdr9XUlogjP+dBCKutFb/ROlebSeSHVyzu523BA
 A4ZGi1gMWgExBgVt0pAQBmzglRZ4upmD6ijIvnluyDzOjOdAVf2Aj7OGkRFxJy/64eYZCbzMk
 lMW+mor15Iyh9xZF5XgvotA0Lq2Vdyf2ws0H3v/USI1HnaK6B/iG9so2xkTQR7jE655pviLgl
 oQA5MUuL90GPksMClvMQLxaMsRW2RRvkRpEFeMmeBmz4HVi3m/v2RrgcXtnU98zGITtANrhEl
 7HX+J0mX8j3YsszZLHe6o2YRHxrLfRrY48YGF2erWwZQnlB+fLZZhnkFu362ZVp8DgwBvd/BN
 Bm2GiGWSSl8D95L1AmhIT5fCLsC0iBknwgzz+KCasbXVqt6XL+cuctY+TWRd8zkggNeDNWKWo
 2/ABaU5MYQeeCy1D5L7U5BLmbskxZIgUH4jc6Va6zdl9fIwJ7EnPlpPgI7g2goeQQrRXEO7SD
 dy0C282fACG1TjRT/pAkpCubYuHlYdD9udrQqTu0jJcXrw5Gyph+MTosIUQutpUVDKbTXrEU4
 ruGjT7ctX5kx7k+ji2Tegp9W1QcsOVrcN+yYALpjFleQ9S9ThAimJdklAwibQXrms7Bqo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Testcase approach for MAP_GROWSDOWN
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18.06.20 08:15, Pravin Raghul wrote:
> We are planning to add the following testcases for MAP_GROWSDOWN, please let us know your thoughts on this.
>
> We assign the memory region allocated using MAP_GROWSDOWN to a thread, as a stack, to test the effect of MAP_GROWSDOWN. This is because the kernel only grows the memory region when the stack pointer, is within guard page, when the guard page is touched.
>
>
>       Test Case 1: Grow into an unmapped region
>
>  1. Map an anyonymous memory region of size X, and unmap it.
>  2. Split the unmapped memory region into two.
>  3. The lower memory region is left unmapped.
>  4. The higher memory region is mapped for use as stack, using MAP_FIXED | MAP_GROWSDOWN.
>  5. The higher memory region is provided as stack to a thread, where a recursive function is invoked.
>  6. The stack grows beyond the allocated region, into the lower memory area.

For architectures where the stack grows up (e.g. parisc), you need to start from lower memory region
and grow up into the higher one. I can test on parisc hardware or give you access if needed.

Helge

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
