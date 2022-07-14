Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE6F574EB0
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jul 2022 15:09:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B2C83C8E8C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jul 2022 15:09:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F192C3CA947
 for <ltp@lists.linux.it>; Thu, 14 Jul 2022 12:38:06 +0200 (CEST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 45F7810006B8
 for <ltp@lists.linux.it>; Thu, 14 Jul 2022 12:38:06 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id ez10so2590219ejc.13
 for <ltp@lists.linux.it>; Thu, 14 Jul 2022 03:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Da9JEC7sUGHY+kW86al+MlF51R6SUQjf24M49G8OwHc=;
 b=PEmrPIbEuGUIJ24Pjzg7NnMyz7pc+NQA+VXRl69yo4RvPbufjLnopzBx9AcwaMzGur
 SL28jyepusZbrr28RB5BbdXmOiO+0NJ8FeLblpnAlxK3bJom9YF9WDFP/Np3Y/hRKbpm
 uhYn0x0HFWhu8qIwiVOgWRz0fdjYNBLvMKefXwfigc9jX8CX/rf2HU9zv2Opu9pGI3hx
 dh/Z7coRYc8tm5Wv/gsyLEZCGuXZT3JCmL5w+gbzmrFvMdGE1FdZ9BQb1jst8vD1sPJA
 6xPIZlE/qV+aH+fiQG+eG5/FQFKjZm/evgmmuOlUhn477iA4VCEpejaXdO7EUQ7d+Dep
 itgw==
X-Gm-Message-State: AJIora/7645Ejj3K02nZLD+6jn/bgcoXFzj0+70lyHAhFVBsTj9L/0/H
 8PwcJtQlGgbLecJpyGnNoGs=
X-Google-Smtp-Source: AGRyM1tylAikhT0jp8xuKYehbTcWTlzDur0ynRLeAdWpAL3ujadz/4Hz4YTv5mkPVzYlKcYDne9mDA==
X-Received: by 2002:a17:907:2815:b0:72b:70f6:4ced with SMTP id
 eb21-20020a170907281500b0072b70f64cedmr7883051ejc.353.1657795085810; 
 Thu, 14 Jul 2022 03:38:05 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 ey6-20020a0564022a0600b00431962fe5d4sm805026edb.77.2022.07.14.03.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 03:38:04 -0700 (PDT)
Message-ID: <78cd3375-e95e-51b2-bf89-bad645e16ea4@kernel.org>
Date: Thu, 14 Jul 2022 12:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20220713154458.253076-1-dario.binacchi@amarulasolutions.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220713154458.253076-1-dario.binacchi@amarulasolutions.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 14 Jul 2022 15:09:04 +0200
Subject: Re: [LTP] [PATCH v2] can: slcan: do not sleep with a spin lock held
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
Cc: lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeroen Hofstee <jhofstee@victronenergy.com>, linux-can@vger.kernel.org,
 lkp@lists.01.org, Eric Dumazet <edumazet@google.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 kernel test robot <oliver.sang@intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, ltp@lists.linux.it,
 Wolfgang Grandegger <wg@grandegger.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13. 07. 22, 17:44, Dario Binacchi wrote:
> We can't call close_candev() with a spin lock held, so release the lock
> before calling it.
> 
> Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE@xsang-OptiPlex-9020/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Release the lock just before calling the close_candev().
> 
>   drivers/net/can/slcan/slcan-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/slcan-core.c
> index 54d29a410ad5..5214421dedf3 100644
> --- a/drivers/net/can/slcan/slcan-core.c
> +++ b/drivers/net/can/slcan/slcan-core.c
> @@ -689,6 +689,7 @@ static int slc_close(struct net_device *dev)
>   		clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
>   	}
>   	netif_stop_queue(dev);
> +	spin_unlock_bh(&sl->lock);
>   	close_candev(dev);
>   	sl->can.state = CAN_STATE_STOPPED;
>   	if (sl->can.bittiming.bitrate == CAN_BITRATE_UNKNOWN)
> @@ -696,7 +697,6 @@ static int slc_close(struct net_device *dev)
>   
>   	sl->rcount   = 0;
>   	sl->xleft    = 0;

So all these sets need not be under the spinlock?

If so, you should explain why in the commit message.

> -	spin_unlock_bh(&sl->lock);
>   
>   	return 0;
>   }

thanks,
-- 
js
suse labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
