Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2330BD9B
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 13:03:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F3E63C7443
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 13:03:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7C68A3C2EE2
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 13:03:55 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D40EE1A00245
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 13:03:54 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5AD789F761;
 Tue,  2 Feb 2021 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612267433; bh=DLKaLXSEExWFUMDnMQuUsysGfdXBjXpWiPONOlQE+wE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=AGy7yRH4X/Zc6+hcTWaO5LbWAjbMnFFMswOrf+FpPAxpwVvZUVdC6bZKuyHoiyqeG
 do5MXlR84oetSqER3TxCKCMkQ/N5Ws8DM1+pYH/EtA5NVxAEE9bdGZ2vzd98fsIIfV
 sFRoP/Mzage3m/TuRo2PwGNBK4f8zv3yUKXsbGSg=
To: Petr Vorel <pvorel@suse.cz>
References: <20210202074753.31516-1-pvorel@suse.cz>
 <47060cdf-58a3-2568-3508-31436b9c6e12@jv-coder.de> <YBkmQl1lFmxbdpcb@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <6c7e6893-efe2-0ac2-2a68-b7e4796e85d7@jv-coder.de>
Date: Tue, 2 Feb 2021 13:04:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBkmQl1lFmxbdpcb@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Run cleanup also on timeout
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
>>> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
>>> index 69f007d89..35ad6d2d7 100644
>>> --- a/testcases/lib/tst_test.sh
>>> +++ b/testcases/lib/tst_test.sh
>>> @@ -21,7 +21,7 @@ export TST_LIB_LOADED=3D1
>>>    . tst_security.sh
>>>    # default trap function
>>> -trap "tst_brk TBROK 'test interrupted'" INT
>>> +trap "tst_brk TBROK 'test interrupted or timeout'" INT
>> should be "timed out" for consistency
> You probably mean consistency with TST_RETRY_FN_EXP_BACKOFF()
> I tried to be consistent with previous message:
> zram01 1 TBROK: test killed, timeout! If you are running on slow machine,=
 try exporting LTP_TIMEOUT_MUL > 1
> That one should be changed as well.
> I slightly prefer "timeout", but I'm not a native speaker.
No I was meant the "test interrupted" part. "test interrupt or timeout" =

would be consistent.
I am not a native speaker either, but "test interrupted or timed out" =

sound more correct to me.

J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
