Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80BB0EA0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:10:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D99C23C20BA
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:10:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8AD483C0507
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:10:04 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 923E9604C88
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:10:03 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CC987l061743;
 Thu, 12 Sep 2019 12:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2019-08-05;
 bh=saWAMvWpFH48MqK6rbD8gDkWTj5Qpa5Fok2rm5z/MJ4=;
 b=Dux84QDEbIAh8CAIGEpRY7il4difl3iD+4QPJaWgj/jbTVtfJkbTGIMq5tJvgXd8AgqP
 PCzLG4wk+65noe1yvCGi2hLAlFbfExthW9WDCVKZuYxcp01+rglyTlFXjEdYW1VEsc4e
 e14W9fx/yXhvRjCUmszia0WhmZHSYzdhvR4UIQ+gaQ5G+EmX7POIF5mic0keXf5rNTqb
 u05yZ4+g1TOpS6wE87COcBpz7UCAcIwWyHEP6W0fqzLX/BXJP5AUOBcdggO4eAerekbn
 nhoF1Pg8MqQ0byiQLjVzqvuz9AvmEYVeWBnWpwW6D4ZtSKaWnBCxc2xuW8l7yZr0+2Kr 6g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uw1jkqy7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:10:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CC7iM4021080;
 Thu, 12 Sep 2019 12:09:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2uy33c6q71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:09:59 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8CC9rQU007977;
 Thu, 12 Sep 2019 12:09:58 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 05:09:53 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190903141610.28887-1-pvorel@suse.cz>
 <20190903141610.28887-2-pvorel@suse.cz>
Organization: Oracle Corporation
Message-ID: <867402c7-9a38-9646-6936-1eb6988a48b8@oracle.com>
Date: Thu, 12 Sep 2019 15:12:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903141610.28887-2-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=948
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120131
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/7] tst_net.sh: enhance tst_add_ipaddr(),
 add tst_del_ipaddr()
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

Hi Petr,
On 03.09.2019 17:16, Petr Vorel wrote:
> These changes are intended for easier handling with IP addresses
> (not have to calculate dad for IPv6 when adding IP address).
> Add -a IP and -s options to tst_add_ipaddr()
> 
> tst_del_ipaddr() (which uses internally tst_add_ipaddr()) is defined
> mainly for better code readability.
...
>  
> -	tst_res_ TINFO "set remote addr $(tst_ipaddr rhost)/$mask"
> -	tst_rhost_run -c "ip addr add $(tst_ipaddr rhost)/$mask dev $iface $dad"
> +	tst_res_ TINFO "set remote addr $addr"

                         ^
                  Should be $action here?

> +	tst_rhost_run $rsafe -c "ip addr $action $addr dev $iface $dad"
> +}
> +
> +# tst_del_ipaddr [ tst_add_ipaddr options ]
> +# Delete IP address
> +tst_del_ipaddr()
> +{
> +	tst_add_ipaddr -d $@
>  }
>  
>  # tst_restore_ipaddr [TYPE] [LINK]
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
