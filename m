Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B581FFEA2
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:40:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D2BE3C23EB
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:40:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2D9A63C17C7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:40:40 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BECA810018A6
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:40:39 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2C1549F832;
 Mon, 18 Nov 2019 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574059238; bh=Kbvq22hrjtbYPHyfXz3B792exFYtNsFeu0+zu0ytkZU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=riN4/6soJk5wdtn38jEaviV8U4bHmgaHlXF8WhqMkVohA2vWSbP4gaYnFtHcchz0q
 rQiWAq2R794MADYLGmamLwxQZg5hAMjhFjC1vUWl41yzGEFljj4Sp8i/W6MWQdWdOV
 FpGcTx7XEJB1p2OA84MMOCR5ZC/m5k74OkXs+P08=
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
 <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
 <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
 <CAEemH2dPwqX1FtNvF7=hxbAfVMz7i_u+TpUBaU1mqKhY-G0Vig@mail.gmail.com>
 <20191118061634.GA21536@x230>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <4e9d5014-baea-98ba-c042-a65e5eca64e1@jv-coder.de>
Date: Mon, 18 Nov 2019 07:40:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118061634.GA21536@x230>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
> I'm for merging this. I just wonder if it's not better to remove $with_bash and
> $with_python (as part of this patch), if they're not working.
I think you misunderstood. I did not say, that Bash and Python switches 
were not working,
just that the dependency of bash and python for realtime tests did not 
work -> it was not a dependency.
The realtime testsuite could be enabled without bash and python enabled.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
