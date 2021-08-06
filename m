Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA143E2723
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:21:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 766A93CA3A0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:21:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB4E13C5EA4
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:21:11 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3FE2B1000A20
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:21:10 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 193649F69E;
 Fri,  6 Aug 2021 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1628241665; bh=VOBEXrZoX+Ia+/PyFmmE1o74SVhaULdY9xHGTjGKuwA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VHGcq8VNebeV2B61Z6H4vaH29VN6y5njhtpASw8MIqmQRjsxpWOXHw02Tob08ALjz
 kQfuav2lSrSVOUSX9rxSMDDjn3F8g1sCm+hJRmdAGfHLr6sxm2crzs1iYf0rQvE05x
 muTOuzFAyF470jGfaXwOnhz/XHpwwRDSYL5zCasA=
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>, Petr Vorel <pvorel@suse.cz>
References: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
 <YQzpXHDvFmoaSFhi@pevik> <bb73135b-4ee3-71c3-5442-bf39064b3534@jv-coder.de>
 <VI1PR04MB4958D95FE7A478B771C73A4493F39@VI1PR04MB4958.eurprd04.prod.outlook.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d2f9c8df-96bb-c115-6c2c-f3d8eb02c62b@jv-coder.de>
Date: Fri, 6 Aug 2021 11:21:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB4958D95FE7A478B771C73A4493F39@VI1PR04MB4958.eurprd04.prod.outlook.com>
Content-Language: en-US
X-Spam-Status: No, score=-2.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Bogdan,

On 8/6/2021 11:06 AM, Bogdan Lezhepekov wrote:
> Hi Joerg, Petr!
>
> Thanks for reviewing and commenting! I don't have a strong opinion on 
> how the test flow should look like, but I can say this sleep 
> definitely makes the test much more reliable.
>
> The results, we get on known to both of you SUSE Carwos, are pretty 
> consistent. My feeling is that 8/10 runs end up with some sporadic 
> failures. The fact that extra sleep solves the problem obviously 
> indicates a lack of synchronization.
>
> @Joerg: if you need more info about the environment, please reach out 
> to me.
Strange, my test environment was probably something derived from carwos 
(not exactly sure anymore).
I will try to reproduce and implement a correct synchronization as 
described in my earlier mail next week.
But maybe you can tell me more details about the actual used environment 
(If it is related to carwos customer project, you can send it to my 
corporate email address: joerg.vehlow@aox-tech.de).

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
