Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A786A1BE4B4
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 19:04:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DD1A3C5EF9
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 19:04:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 662553C281C
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 19:04:43 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 02FA260117E
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 19:04:42 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TGx2rg052536;
 Wed, 29 Apr 2020 17:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=sdqS6WloqwdmdVnSSat7pM+d1ZOQsdbuO4myqecb3Y0=;
 b=z9BR0P2d4PZOnEiW+yGex+hTfEHvADT5FhbZcAVZ56NVW4IqjEAyD2cF9zkHFuk1myVx
 cBJYwNLzjYr9fN8IOfkrzYg7jb3D0gWotnyXzhMuEsSamvsejUeVJX/bfi6FA0JkjnWo
 ZbF7zqNGKhyaQ0nVQnLR4svrNV86UgKiGRY6c27S/zj14JaxwoNLzO6ZOzAmIq984XkD
 WcjBx/xFGhnWL1qa8rTUNGih9tSZOMSjLwn69GmQV206brKxDDKFCmzdv/bs/b3GJBpv
 cfTsnRWcbXgerg+swSgx/7ic4UUWLqi0Qidz7gE6vahRxgluUi927P7hdz155BVf3O4Q zA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30nucg70tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 17:04:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TGvOeN132672;
 Wed, 29 Apr 2020 17:04:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 30my0hh289-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 17:04:38 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03TH4aXL026387;
 Wed, 29 Apr 2020 17:04:37 GMT
Received: from [10.23.23.35] (/91.247.148.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Apr 2020 10:04:36 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20200423131632.20525-1-pvorel@suse.cz>
 <20200423131632.20525-3-pvorel@suse.cz>
 <8b3ae56d-1c28-e43b-abea-963a32fff8f6@oracle.com>
 <20200429104129.GA685@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <638d88f6-d140-8982-1555-c83c5adb83e9@oracle.com>
Date: Wed, 29 Apr 2020 20:04:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429104129.GA685@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290134
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] net/route: Add netlink based route change
 tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29.04.2020 13:41, Petr Vorel wrote:
> Hi Alexey,
> 
>> Minor comments below.
> Thanks for your review!
> 

Hi Petr,

>>> +	for (i = 0; i < num_loops; i++) {
>>> +		if (iface_len > 1)
>>> +			tst_res(TINFO, "testing gw: %s, iface: %s",
>>> +					p_gw->ip_str, p_iface->iface);
>>> +		else if (gw_len > 1)
>>> +			tst_res(TINFO, "testing gw: %s", p_gw->ip_str);
>>> +		else
>>> +			tst_res(TINFO, "testing dst: %s/%d", p_dst->ip_str, prefix);
> 
> 
>> It would be better to avoid printing it on every iteration, especially
>> with the large NS_TIMES.
> Understand, I thought you wouldn't like it. How about print only on error?
> 
>>> +
>>> +		rtnl_route(p_iface->index, p_dst->ip, gw ? p_gw->ip : NULL,
>>> +			   prefix, RTM_NEWROUTE);
>>> +		send_udp(p_rhost->ip);
>>> +		rtnl_route(p_iface->index, p_dst->ip, gw ? p_gw->ip : NULL,
>>> +			   prefix, RTM_DELROUTE);
>>> +
>>> +		if (gw)
>>> +			p_gw = p_gw->next ?: gw;
>>> +		p_dst = p_dst->next ?: dst;
>>> +		p_iface = p_iface->next ?: iface;
>>> +		p_rhost = p_rhost->next ?: rhost;
>>> +	}
>>> +
>>> +	tst_res(TPASS, "routes created and deleted");
>>> +}
> 
> Something like this?
> 
> static void print_route_info(int iface, struct sockaddr *dst,
> 			     struct sockaddr *gw, int type)
> {

Perhaps brk_on_route_error() as it has tst_brk()?

> 	char dst_str[INET6_ADDRSTRLEN], gw_str[INET6_ADDRSTRLEN];
> 	tst_sock_addr(dst, sizeof(dst), dst_str, sizeof(dst_str));
> 	if (gw)
> 		tst_sock_addr(gw, sizeof(gw), gw_str, sizeof(gw_str));
> 
> 	tst_res(TINFO, "type: %s, iface: %d, dst: %s, gw: %s",
> 		type == RTM_NEWROUTE ? "RTM_NEWROUTE" : "RTM_DELROUTE",
> 		iface, dst_str, gw ? gw_str : "null");
> 	tst_brk(TBROK, "failed due previous netlink errors");

"failed due to the previous..."


Also, what about passing the error message type and errno to this
function, i.e. changing "TFAIL, TINFO, TBROK" to "TINFO, TFAIL"?

static void brk_on_route_error(const char *msg, int errno, int iface, ...
{
...
        tst_res(TINFO, "...");
	tst_brk(TFAIL, "%s failed (errno=%d): %s", msg, errno, strerror(errno));

> }
> 
> static void rtnl_route(int iface, struct addrinfo *dst, struct addrinfo *gw,
> 		       int type)
> {
> 	struct mnl_socket *nl;
> 	char buf[MNL_SOCKET_BUFFER_SIZE];
> 	struct nlmsghdr *nlh;
> 	struct rtmsg *rtm;
> 	uint32_t seq, portid;
> 	struct in6_addr dst_in6, gw_in6;
> 	in_addr_t dst_ip, gw_ip;
> 	int ret;> 
> 	nlh = mnl_nlmsg_put_header(buf);
> 	nlh->nlmsg_type	= type;
> 
> 	nlh->nlmsg_flags = NLM_F_ACK;
> 	if (type == RTM_NEWROUTE)
> 		nlh->nlmsg_flags |= NLM_F_REQUEST | NLM_F_CREATE | NLM_F_REPLACE;
> 
> 	nlh->nlmsg_seq = seq = time(NULL);
> 
> 	rtm = mnl_nlmsg_put_extra_header(nlh, sizeof(struct rtmsg));
> 	rtm->rtm_family = family;
> 	rtm->rtm_dst_len = prefix;
> 	rtm->rtm_src_len = 0;
> 	rtm->rtm_tos = 0;
> 	rtm->rtm_protocol = RTPROT_STATIC;
> 	rtm->rtm_table = RT_TABLE_MAIN;
> 	rtm->rtm_type = RTN_UNICAST;
> 	rtm->rtm_scope = gw ? RT_SCOPE_UNIVERSE : RT_SCOPE_LINK;
> 	rtm->rtm_flags = 0;
> 
> 	if (is_ipv6) {
> 		dst_in6 = ((struct sockaddr_in6 *)dst->ai_addr)->sin6_addr;
> 		mnl_attr_put(nlh, RTA_DST, sizeof(struct in6_addr), &dst_in6);
> 	} else {
> 		dst_ip = ((struct sockaddr_in *)dst->ai_addr)->sin_addr.s_addr;
> 		mnl_attr_put_u32(nlh, RTA_DST, dst_ip);
> 	}
> 
> 	mnl_attr_put_u32(nlh, RTA_OIF, iface);
> 
> 	if (gw) {
> 		if (is_ipv6) {
> 			gw_in6 = ((struct sockaddr_in6 *)gw->ai_addr)->sin6_addr;
> 			mnl_attr_put(nlh, RTA_GATEWAY, sizeof(struct in6_addr), &gw_in6);
> 		} else {
> 			gw_ip = ((struct sockaddr_in *)gw->ai_addr)->sin_addr.s_addr;
> 			mnl_attr_put_u32(nlh, RTA_GATEWAY, gw_ip);
> 		}
> 	}
> 
> 	nl = mnl_socket_open(NETLINK_ROUTE);
> 	if (nl == NULL) {
> 		tst_res(TFAIL, "mnl_socket_open failed (errno=%d): %s", errno,
> 			strerror(errno));
> 		goto err;

Then:
		brk_on_route_error("mnl_socket_open", errno, iface, dst, gw, type);


> 	}
> 
> 	if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
> 		tst_res(TFAIL, "mnl_socket_bind failed (errno=%d): %s", errno,
> 			strerror(errno));
> 		goto err;
> 	}
> 
> 	portid = mnl_socket_get_portid(nl);
> 
> 	if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
> 		tst_res(TFAIL, "mnl_socket_sendto failed (errno=%d): %s", errno,
> 			strerror(errno));
> 		goto err;
> 	}
> 
> 	ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
> 	if (ret < 0) {
> 		tst_res(TFAIL, "mnl_socket_recvfrom failed (ret=%d, errno=%d): %s",
> 			ret, errno, strerror(errno));
> 		goto err;
> 	}
> 
> 	ret = mnl_cb_run(buf, ret, seq, portid, NULL, NULL);
> 	if (ret < 0) {
> 		tst_res(TFAIL, "mnl_cb_run failed (ret=%d, errno=%d): %s", ret,
> 			errno, strerror(errno));
> 		goto err;
> 	}
> 
> 	mnl_socket_close(nl);
> 	return;
> err:
> 	print_route_info(iface, dst->ai_addr, gw ? gw->ai_addr: NULL, type);
> }
> 
> 
>>> +
>>> +static struct tst_option options[] = {
>>> +	{"6", &ipv6_opt, "-6       Use IPv6 (default is IPv4)"},
>>> +	{"c:", &c_opt, "         Num loops (mandatory)"},
> 
>> "-c x ...
> Fixed.
> 
> 
> BTW I also removed prefix parameter from rtnl_route() (it's a global parameter,
> family is not passed either).
> 
> https://github.com/pevik/ltp/blob/route/c.v5.fixes/testcases/network/stress/route/route-change-netlink.c
> + below is full diff against posted version.
> 
> Kind regards,
> Petr
> 
> diff --git testcases/network/stress/route/route-change-netlink.c testcases/network/stress/route/route-change-netlink.c
> index 57ae02a3c..80677f1a4 100644
> --- testcases/network/stress/route/route-change-netlink.c
> +++ testcases/network/stress/route/route-change-netlink.c
> @@ -177,7 +177,22 @@ static void cleanup(void)
>  		mnl_socket_close(nl);
>  }
>  
> -static void rtnl_route(int iface, struct addrinfo *dst, struct addrinfo *gw, uint32_t prefix, int type)
> +static void print_route_info(int iface, struct sockaddr *dst,
> +			     struct sockaddr *gw, int type)
> +{
> +	char dst_str[INET6_ADDRSTRLEN], gw_str[INET6_ADDRSTRLEN];
> +	tst_sock_addr(dst, sizeof(dst), dst_str, sizeof(dst_str));
> +	if (gw)
> +		tst_sock_addr(gw, sizeof(gw), gw_str, sizeof(gw_str));
> +
> +	tst_res(TINFO, "type: %s, iface: %d, dst: %s, gw: %s",
> +		type == RTM_NEWROUTE ? "RTM_NEWROUTE" : "RTM_DELROUTE",
> +		iface, dst_str, gw ? gw_str : "null");
> +	tst_brk(TBROK, "failed due previous netlink errors");
> +}
> +
> +static void rtnl_route(int iface, struct addrinfo *dst, struct addrinfo *gw,
> +		       int type)
>  {
>  	struct mnl_socket *nl;
>  	char buf[MNL_SOCKET_BUFFER_SIZE];
> @@ -229,31 +244,44 @@ static void rtnl_route(int iface, struct addrinfo *dst, struct addrinfo *gw, uin
>  	}
>  
>  	nl = mnl_socket_open(NETLINK_ROUTE);
> -	if (nl == NULL)
> -		tst_brk(TBROK, "mnl_socket_open failed (errno=%d): %s", errno,
> +	if (nl == NULL) {
> +		tst_res(TFAIL, "mnl_socket_open failed (errno=%d): %s", errno,
>  			strerror(errno));
> +		goto err;
> +	}
>  
> -	if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0)
> -		tst_brk(TBROK, "mnl_socket_bind failed (errno=%d): %s", errno,
> +	if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
> +		tst_res(TFAIL, "mnl_socket_bind failed (errno=%d): %s", errno,
>  			strerror(errno));
> +		goto err;
> +	}
>  
>  	portid = mnl_socket_get_portid(nl);
>  
> -	if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0)
> -		tst_brk(TBROK, "mnl_socket_sendto failed (errno=%d): %s", errno,
> +	if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
> +		tst_res(TFAIL, "mnl_socket_sendto failed (errno=%d): %s", errno,
>  			strerror(errno));
> +		goto err;
> +	}
>  
>  	ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
> -	if (ret < 0)
> -		tst_brk(TBROK, "mnl_socket_recvfrom failed (ret=%d, errno=%d): %s",
> +	if (ret < 0) {
> +		tst_res(TFAIL, "mnl_socket_recvfrom failed (ret=%d, errno=%d): %s",
>  			ret, errno, strerror(errno));
> +		goto err;
> +	}
>  
>  	ret = mnl_cb_run(buf, ret, seq, portid, NULL, NULL);
> -	if (ret < 0)
> -		tst_brk(TBROK, "mnl_cb_run failed (ret=%d, errno=%d): %s", ret,
> +	if (ret < 0) {
> +		tst_res(TFAIL, "mnl_cb_run failed (ret=%d, errno=%d): %s", ret,
>  			errno, strerror(errno));
> +		goto err;
> +	}
>  
>  	mnl_socket_close(nl);
> +	return;
> +err:
> +	print_route_info(iface, dst->ai_addr, gw ? gw->ai_addr: NULL, type);
>  }
>  
>  static void send_udp(struct addrinfo *rhost_addrinfo)
> @@ -274,19 +302,11 @@ static void run(void)
>  	struct iface *p_iface = iface;
>  
>  	for (i = 0; i < num_loops; i++) {
> -		if (iface_len > 1)
> -			tst_res(TINFO, "testing gw: %s, iface: %s",
> -					p_gw->ip_str, p_iface->iface);
> -		else if (gw_len > 1)
> -			tst_res(TINFO, "testing gw: %s", p_gw->ip_str);
> -		else
> -			tst_res(TINFO, "testing dst: %s/%d", p_dst->ip_str, prefix);
> -
>  		rtnl_route(p_iface->index, p_dst->ip, gw ? p_gw->ip : NULL,
> -			   prefix, RTM_NEWROUTE);
> +			   RTM_NEWROUTE);
>  		send_udp(p_rhost->ip);
>  		rtnl_route(p_iface->index, p_dst->ip, gw ? p_gw->ip : NULL,
> -			   prefix, RTM_DELROUTE);
> +			   RTM_DELROUTE);
>  
>  		if (gw)
>  			p_gw = p_gw->next ?: gw;
> @@ -300,7 +320,7 @@ static void run(void)
>  
>  static struct tst_option options[] = {
>  	{"6", &ipv6_opt, "-6       Use IPv6 (default is IPv4)"},
> -	{"c:", &c_opt, "         Num loops (mandatory)"},
> +	{"c:", &c_opt, "-c x     Num loops (mandatory)"},
>  	{"d:", &d_opt, "-d iface Interface to work on (mandatory)"},
>  	{"g:", &g_opt, "-g x     Gateway IP"},
>  	{"p:", &p_opt, "-p port  Rhost port (mandatory)"},
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
