Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60E5C1F8
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 19:30:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ADDF3C1DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 19:30:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 602423C1D87
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 19:30:54 +0200 (CEST)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 54952140112D
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 19:30:53 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id w9so537718wmd.1
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 10:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/Xi3dP2as3IG528X+Pko9xkFRs702hbLeYHSx7qX+o=;
 b=Lwt2KnTeHOG9cxlLVy07m5+x7HLd4DDwMMQMOYtTip6ca3MmE9MbnMrF3acO+mzknV
 gqDEZPavpyLi0U+L1QyJ8fPlyuCAqW5G+4erqwP+5a6sh2wpTxOiyJJtbrqRz9uHn7PH
 qgRCz3c+d8SR2JldNoO9e3Cas2Jdjw6aP3zkrjjFR2pNlaN7alhoWAofW8F0xeAdKvpl
 213EBaPcRrRYy/6M2LtaeBQNBxazp2jXYM1ywGvYMCKWCRnRShoxsvQiCkQG4PDUoCO8
 MoJnyxUXr6Jw/YH8b7H56FdajS/ae6aHGeTj3+vbSG0H7yeoXQuxfbI0512jyVBx9kPE
 6wWQ==
X-Gm-Message-State: APjAAAVHP8uYyTiQ3V/4YoVsrMntkm/xpRmYfMS4YcadD3CIuEvk/Txn
 bdO5zar82fcnHUg/Kh0maXC0uw==
X-Google-Smtp-Source: APXvYqzfzStGPlDN+EuoDcTflU6PfgBcqP3b54klRiFX0XlkceYabKm6eOHRIN5/uLkO+TnjOGYmrQ==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr276316wmb.112.1562002252781;
 Mon, 01 Jul 2019 10:30:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b8:794:183e:9e2a?
 ([2001:b07:6468:f312:b8:794:183e:9e2a])
 by smtp.gmail.com with ESMTPSA id t140sm664628wmt.0.2019.07.01.10.30.51
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 10:30:52 -0700 (PDT)
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
 <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
 <20190701145308.GA19368@ranerica-svr.sc.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cde7f924-10c9-7ffc-d323-b786240244b3@redhat.com>
Date: Mon, 1 Jul 2019 19:30:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701145308.GA19368@ranerica-svr.sc.intel.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Kernel BUG?] SMSW operation get success on UMIP KVM guest
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
Cc: kernellwp@gmail.com, ricardo.neri@intel.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Ping Fang <pifang@redhat.com>,
 tglx@linutronix.de, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 01/07/19 16:53, Ricardo Neri wrote:
>>
>> (*) before the x86 people jump at me, this won't happen unless you
>> explicitly pass an option to QEMU, such as "-cpu host,+umip". :)  The
>> incorrect emulation of SMSW when CR4.UMIP=1 is why.
> Paolo, what do you mean by the incorrect emulation of SMSW?

When KVM tries to emulate UMIP on a system that doesn't have it, SMSW
won't cause a #GP.  The processor is simply not able to trap to the
hypervisor on SMSW (unlike SGDT/SIDT/SLDT/STR), so it's impossible to do
better.

Paolo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
